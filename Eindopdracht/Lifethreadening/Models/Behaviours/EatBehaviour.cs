﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lifethreadening.Models.Behaviours
{
    /// <summary>
    /// This class is used to contain behavior characteristics partaining to the behaviour of eating
    /// </summary>
    public abstract class EatBehaviour : Behaviour
    {
        private const double HP_INCREASE_BY_NUTRITION_FACTOR = 1.0 / 3.0;

        /// <summary>
        /// Creates a new eat behaviour
        /// </summary>
        /// <param name="animal">The animal to create this behaviour for</param>
        public EatBehaviour(Animal animal) : base(animal)
        {
        }

        /// <summary>
        /// This method lets an animal consume a source of energy
        /// </summary>
        /// <param name="element">The element to consume</param>
        protected void Consume(SimulationElement element)
        {
            int nutrition = element.DepleteNutritionalValue();
            Animal.AddHp((int)(nutrition * HP_INCREASE_BY_NUTRITION_FACTOR));
            Animal.AddEnergy(nutrition);
        }

        /// <summary>
        /// This method finds posible targets that can be eaten
        /// </summary>
        /// <param name="locations">All locations in the world</param>
        /// <param name="filter">A filter for waht the animal can and can't eat</param>
        /// <returns>A dictionairy containing all elements that can be eaten</returns>
        private IDictionary<SimulationElement, double> FindTargets(IDictionary<Location, Path> locations, Func<SimulationElement, bool> filter)
        {
            IDictionary<SimulationElement, double> targets = new Dictionary<SimulationElement, double>();
            foreach(KeyValuePair<Location, Path> location in locations)
            {
                // The closer the target is, the higher the priority
                double distanceFactor = 1 / Math.Sqrt(location.Value.Length);
                foreach(SimulationElement element in location.Key.SimulationElements)
                {
                    if(element != Animal && filter(element))
                    {
                        targets.Add(element, element.GetNutritionalValue() * distanceFactor);
                    }
                }
            }
            return targets;
        }

        /// <summary>
        /// This method calculates the most relevant foodsource
        /// </summary>
        /// <param name="targets">A list of all possible food sources</param>
        /// <returns>The most relevan food source</returns>
        private SimulationElement FindMostRelevantTarget(IDictionary<SimulationElement, double> targets)
        {
            SimulationElement mostRelevantTarget = targets.Keys.FirstOrDefault();
            foreach(KeyValuePair<SimulationElement, double> target in targets)
            {
                if(target.Value > targets[mostRelevantTarget])
                {
                    mostRelevantTarget = target.Key;
                }
            }
            return mostRelevantTarget;
        }

        /// <summary>
        /// This method calculates a point of interest
        /// </summary>
        /// <param name="filter">A filter for what food can and cant be eatem</param>
        /// <returns>A incentive to reach the point of interest and execut an action</returns>
        protected Incentive Guide(Func<SimulationElement, bool> filter)
        {
            IDictionary<Location, Path> locations = Animal.DetectSurroundings();
            SimulationElement mostRelevantTarget = FindMostRelevantTarget(FindTargets(locations, filter));

            if(mostRelevantTarget != null)
            {
                Path pathToFollow = locations[mostRelevantTarget.Location];
                // There is a target
                return new Incentive(() =>
                {
                    // Move towards the element and try to eat it
                    Animal.MoveAlong(pathToFollow);
                    Inflict(mostRelevantTarget);
                }, GetMotivation());
            }

            return null;
        }

        /// <summary>
        /// This method calculates how hungry an animal is
        /// </summary>
        /// <returns>How hungry the animal is</returns>
        protected int GetHunger()
        {
            return Math.Max(0, (int)((((100 - Animal.Hp) * 1.0 / 3.0) + 100 - Animal.Energy) / (1.0 + 1.0 / 3.0)));
        }

        /// <summary>
        /// This method inflicts the consequences of consumtion on the consumed element
        /// </summary>
        /// <param name="target">The element to consume</param>
        protected abstract void Inflict(SimulationElement target);

        /// <summary>
        /// This method returns the motivation the animal has to act on this behaviour
        /// </summary>
        /// <returns>The motivation to execute this behaviour</returns>
        protected abstract int GetMotivation();
    }
}
