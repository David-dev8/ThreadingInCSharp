﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lifethreadening.Models
{
    public class WorldContext
    {
        public Weather Weather { get; set; }
        public DateTime Date { get; set; }

        public WorldContext(Weather weather, DateTime date)
        {
            Weather = weather;
            Date = date;
        }
    }
}