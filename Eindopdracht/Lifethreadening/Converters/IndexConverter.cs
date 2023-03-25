﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Xaml.Data;

namespace Lifethreadening.Converters
{
    public class IndexConverter : IValueConverter
    {
        private IList<object> _seenItems = new List<object>();

        public object Convert(object value, Type targetType, object parameter, string language)
        {
            var index = _seenItems.IndexOf(value);
            if (index == -1)
            {
                index = _seenItems.Count;
                _seenItems.Add(value);
            }
            return index + 1;
        }

        public object ConvertBack(object value, Type targetType, object parameter, string language)
        {
            throw new NotImplementedException();
        }
    }
}
