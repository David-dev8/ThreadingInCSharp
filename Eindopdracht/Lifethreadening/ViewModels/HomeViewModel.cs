﻿using Lifethreadening.Base;
using Lifethreadening.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Lifethreadening.ViewModels
{
    public class HomeViewModel : BaseViewModel
    {
        private const int AMOUNT_OF_SLOTS = 3;
        private KeyValuePair<string, Simulation> _selectedSlot;

        public ICommand CreateNewGameCommand { get; set; }
        public KeyValuePair<string, Simulation> SelectedSlot
        {
            get
            {
                return _selectedSlot;
            }
            set
            {
                _selectedSlot = value;
                NotifyPropertyChanged();
            }
        }
        public ICommand GoToStatisticsCommand { get; set; }
        public ICommand GoToCustomSpieciesCommand { get; set; }
        public IDictionary<string, Simulation> Slots { get; set; }

        public HomeViewModel(NavigationService navigationService) : base(navigationService)
        {
            CreateNewGameCommand = new RelayCommand(CreateNewGame);

            GoToStatisticsCommand = new RelayCommand(NavigateToStats);
            GoToCustomSpieciesCommand = new RelayCommand(NavigateToCustomSpiecies);

            Slots = new Dictionary<string, Simulation>();
            for(int i = 0; i < AMOUNT_OF_SLOTS; i++)
            {
                Slots.Add(i.ToString(), null);
            }
            SelectedSlot = Slots.First();
        }

        private void CreateNewGame()
        {
            _navigationService.CurrentViewModel = new EcosystemSelectViewModel(_navigationService);
        }

        public void StartGame(int slot) 
        {
            //TODO safeslots
            //Simulation simul = new Simulation();

            //_navigationService.CurrentViewModel = new SimulationViewModel(_navigationService, simul);
        }

        public void NavigateToStats()
        {
            _navigationService.CurrentViewModel = new SimulationDataViewModel(_navigationService,null);
        }

        public void NavigateToCustomSpiecies()
        {
            _navigationService.CurrentViewModel = new CustomSpeciesViewModel(_navigationService);
        }
    }
}
