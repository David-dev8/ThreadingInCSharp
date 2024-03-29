﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lifethreadening.Models.Disasters
{
    /// <summary>
    /// This class is used to contain data about earthquake disasters
    /// </summary>
    public class EarthquakeDisaster : Disaster
    {
        private const string DESCRIPTION = "Earthquake";
        private const int MINIMUM_SHOCKWAVES = 100;
        private const int MAXIMUM_SHOCKWAVES = 8000;
        private const double RICHTER_SCALE_LOG_BASE = 2.5;

        private Random _random = new Random();
        private int _shockwaves;

        /// <summary>
        /// Creates a new earthquake disaster
        /// </summary>
        /// <param name="contextService">The contextservice</param>
        public EarthquakeDisaster(WorldContextService contextService) : base(DESCRIPTION, contextService)
        {
            _shockwaves = _random.Next(MINIMUM_SHOCKWAVES, MAXIMUM_SHOCKWAVES);
        }

        public override string GetLongDescription()
        {
            return $"Earthquake. Initated at: {DateInitiated:d}. Strength: {CalculateRichterScaleValue():0.0} on the Richter scale.";
        }

        public override void Strike(IEnumerable<SimulationElement> simulationElements)
        {
            // Repeated shockwaves
            for(int i = 1; i < _shockwaves; i++)
            {
                double maxIntensity = (1 / (20 * Math.Sqrt(Math.Log10(i * Math.Sqrt(i + 1)))));
                foreach(SimulationElement simulationElement in simulationElements)
                {
                    if(_random.NextDouble() < maxIntensity)
                    {
                        Damage(simulationElement);
                    }
                }
            }
        }

        /// <summary>
        /// This method lets the earthquake damage all affected animals in the simulation
        /// </summary>
        /// <param name="simulationElement">A list of all simulation elements that are affected by the earthquake</param>
        private void Damage(SimulationElement simulationElement)
        {
            if(simulationElement is Animal animal)
            {
                animal.AddHp(-1);
            }
        }

        /// <summary>
        /// This methods calculates the serverity of the earthquake expressed in a Richter value
        /// </summary>
        /// <returns>The Richter value of the earthquake</returns>
        private double CalculateRichterScaleValue()
        {
            return Math.Log(_shockwaves, RICHTER_SCALE_LOG_BASE);
        }
    }
}
