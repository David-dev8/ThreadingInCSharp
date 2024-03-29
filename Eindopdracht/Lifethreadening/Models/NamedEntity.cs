﻿using System;
using Lifethreadening.Base;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lifethreadening.Models
{
    /// <summary>
    /// This class is used to store data about names
    /// </summary>
    public class ChartNamedEntity : Observable
    {
        private string _name;

        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
                NotifyPropertyChanged();
            }
        }

        public ChartNamedEntity(string name)
        {
            Name = name;
        }
    }
}
