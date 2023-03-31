﻿using Lifethreadening.Base;
using Lifethreadening.DataAccess.Database;
using Lifethreadening.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.Networking.NetworkOperators;

namespace Lifethreadening.ViewModels
{
    /// <summary>
    /// This is the viewmodel for the home view
    /// </summary>
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


        private Simulation _selectedPastGame;
        public Simulation SelectedPastGame
        {
            get 
            {
                return _selectedPastGame;
            }
            set 
            {
                _selectedPastGame = value;
                NavigateToStats(value);
            }
        }

        public List<Simulation> PastGames 
        {
            get 
            {
                List<Simulation> completedSims = new DatabaseSimulationReader().ReadAll().Where((s) => s.Filename == "").ToList(); ;
                return completedSims;
            }
        }

        /// <summary>
        /// Creates a new home view model
        /// </summary>
        /// <param name="navigationService">The navigation service to be used when navigating</param>
        public HomeViewModel(NavigationService navigationService) : base(navigationService)
        {
            CreateNewGameCommand = new RelayCommand(CreateNewGame);

            GoToCustomSpieciesCommand = new RelayCommand(NavigateToCustomSpiecies);


            Slots = new Dictionary<string, Simulation>();
            for(int i = 0; i < AMOUNT_OF_SLOTS; i++)
            {
                Slots.Add(i.ToString(), null);
            }
            SelectedSlot = Slots.First();
        }

        /// <summary>
        /// This method creates a new game / simulation
        /// </summary>
        private void CreateNewGame()
        {
            _navigationService.CurrentViewModel = new EcosystemSelectViewModel(_navigationService);
        }

        /// <summary>
        /// This method navigates the player to the statistics and data of a previously finished game
        /// </summary>
        /// <param name="sim">The finished simulation to get the data for</param>
        public void NavigateToStats(Simulation sim)
        {
            _navigationService.CurrentViewModel = new SimulationDataViewModel(_navigationService, sim);
        }

        /// <summary>
        /// This method is used to navigate to the create a new species view
        /// </summary>
        public void NavigateToCustomSpiecies()
        {
            _navigationService.CurrentViewModel = new CustomSpeciesViewModel(_navigationService);
        }
    }
}
