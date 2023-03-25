﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Media;

namespace Lifethreadening.Converters
{
    public class PositionToScaleConverter : IValueConverter
    {
        private static readonly double MIN_SCALE = 0.7;

        public object Convert(object value, Type targetType, object parameter, string language)
        {
            //double oldValue;
            //if (value != null)
            //{
            //    oldValue = double.Parse(value.ToString());
            //}
            //else if(parameter != null)
            //{
            //    oldValue = double.Parse(parameter.ToString());
            //}

            //double newValue = oldValue != null ? _index <= 2 ? ((1 - 0.2 * _index) * oldValue) : MIN_SCALE : null;
            //_index++;
            //return newValue; // TODO wat te doen bij false
            var currentSize = double.Parse(parameter.ToString());
            var index = double.Parse(value.ToString());
            return index <= 3 ? ((1 - 0.1 * index) * currentSize) : MIN_SCALE * currentSize; 
            //return _index <= 2 ? ((1 - 0.2 * _index)) : MIN_SCALE;
        }

        public object ConvertBack(object value, Type targetType, object parameter, string language)
        {
            throw new NotImplementedException();
        }
    }
}
