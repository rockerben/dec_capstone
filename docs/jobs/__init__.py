from dagster import job
from analytics.ops import print_op
from analytics.ops.weather import get_cities, extract_weather, transform_weather, load_weather_to_database
from analytics.ops.alpaca import extract_alpaca_markets, transform_alpaca, load_alpaca_to_database

@job()
def run_weather_etl():
    weather_data = extract_weather(get_cities())
    print_op(weather_data)
    load_weather_to_database(transform_weather(weather_data))

@job()
def run_alpaca_etl():
    extracted_data = extract_alpaca_markets()
    print_op(extracted_data)
    load_alpaca_to_database(transform_alpaca(extracted_data))
