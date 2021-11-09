#Se evalua cuántos clicks recibe cada anuncio tras hacer un determinado
#número de impresiones

#Para simplificar se consideran 3 anuncios (manguitos), cada uno con
#una probabilidad distinta de generar un clik

library(contextual)

horizon <- 500 #Número de veces que se participa en el juego
simulations <- 1000 #Número de veces que se repite la simulación
ProbClick <- c(0.1, 0.3, 0.7) #Probabilidad de generar un click, en general 
                              #esto será desconocido

#Se realiza la simulación probabilística
bandit <- BasicBernoulliBandit$new(weights = ProbClick)

#Se implementa una política naïve
policy <- EpsilonFirstPolicy$new(time_steps = 100)

#Se definie al agente que ejecuta los manguitos
agent <- Agent$new(policy, bandit)

#Se ejecuta la simulación
simulator <- Simulator$new(agent, horizon, simulations, 
                           do_parallel = FALSE)

history <- simulator$run()

plot(history, type = "average", regret = FALSE, lwd = 2,
     legend_position = "bottomright")
plot(history, type = "cumulative", regret = FALSE, rate = TRUE, lwd
     = 2)
plot(history, type = "arms")


#Se aplica una política epsilon-greedy con epsilon = 0.1

policy <- EpsilonGreedyPolicy$new(epsilon = 0.1)
agent <- Agent$new(policy,bandit)
simulator <- Simulator$new(agent, 
                           horizon, 
                           simulations, 
                           do_parallel = FALSE)
history <- simulator$run()

plot(history, 
     type = "average", 
     regret = FALSE, 
     lwd = 2, 
     legend_position =  "bottomright")

plot(history, 
     type = "cumulative", 
     regret = FALSE, 
     rate = TRUE, 
     lwd = 2,
     legend_position = "bottomright")

plot(history, 
     type = "arms", 
     legend_position = "topright")


#Se aplica una política epsilon-greedy con epsilon = 0.5

policy <- EpsilonGreedyPolicy$new(epsilon = 0.5)
agent <- Agent$new(policy,bandit)
simulator <- Simulator$new(agent, 
                           horizon, 
                           simulations, 
                           do_parallel = FALSE)
history <- simulator$run()

plot(history, 
     type = "average", 
     regret = FALSE, 
     lwd = 2, 
     legend_position =  "bottomright")

plot(history, 
     type = "cumulative", 
     regret = FALSE, 
     rate = TRUE, 
     lwd = 2,
     legend_position = "bottomright")

plot(history, 
     type = "arms", 
     legend_position = "topright")