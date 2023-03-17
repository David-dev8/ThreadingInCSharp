﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lifethreadening.Models.Behaviours
{
    public abstract class EatBehaviour : Behaviour
    {
        private const double HP_INCREASE_BY_NUTRITION_FACTOR = 1 / 3;

        public EatBehaviour(Animal animal) : base(animal)
        {
        }

        protected void Consume(SimulationElement element)
        {
            int nutrition = element.DepleteNutritionalValue();
            Animal.Hp += (int)(nutrition * HP_INCREASE_BY_NUTRITION_FACTOR);
            Animal.Energy += nutrition;
        }

        private IDictionary<SimulationElement, double> FindTargets(IDictionary<Location, Path> locations, Func<SimulationElement, bool> filter)
        {
            IDictionary<SimulationElement, double> targets = new Dictionary<SimulationElement, double>();
            foreach(KeyValuePair<Location, Path> location in locations)
            {
                // The closer the target is, the higher the priority
                double distanceFactor = 1 / Math.Sqrt(location.Value.Length);
                foreach(SimulationElement element in location.Key.SimulationElements)
                {
                    if(filter(element))
                    {
                        targets.Add(element, element.GetNutritionalValue() * distanceFactor);
                    }
                }
            }
            return targets;
        }

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

        protected Incentive guide(Func<SimulationElement, bool> filter)
        {
            IDictionary<Location, Path> locations = Animal.DetectSurroundings(); // TODO cache?
            SimulationElement mostRelevantTarget = FindMostRelevantTarget(FindTargets(locations, filter));

            if(mostRelevantTarget != null)
            {
                // There is a target
                return new Incentive(() =>
                {
                    // Move towards the element and try to attack it
                    Animal.MoveAlong(locations[mostRelevantTarget.Location]);
                    Inflict(mostRelevantTarget);
                }, GetMotivation());
            }

            return null;
        }

        protected int GetHunger()
        {
            return Math.Max(0, 100 - Animal.Energy);
        }

        protected abstract void Inflict(SimulationElement target);
        protected abstract int GetMotivation();
    }
}
