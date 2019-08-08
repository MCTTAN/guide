# Forecasting with Facebook's Prophet
m <- prophet(data_frame)
make_future_dataframe(m, periods = 365)
tail(future)
forecast <- predict(m, future)
tail(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])

# Plot Forecast
plot(m, forecast)
prophet_plot_components(m, forecast)
