# currency_converter_app

A simple Flutter application to convert currencies and view conversion history.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
- [Branches](#branches)
- [Screens](#screens)
- [API Integration](#api-integration)

## Introduction

Welcome to the Currency Converter App! This Flutter application helps users convert currency amounts between different currencies using live exchange rates and view historical conversion data.

## Features

- Select "From" and "To" currencies from dropdown lists containing all supported currencies.
- Enter an amount (numbers only, default 1) and get the converted value instantly.
- Automatically update converted amount when input changes.
- Swap "From" and "To" currencies with a dedicated button.
- View historical exchange rates for the selected currency pair over the last 4 days.
- Conversion history screen to review past conversions.
- Clean architecture using Bloc pattern and Dio for API calls.
- Error handling with user-friendly messages.

## Getting Started

### Prerequisites

Ensure you have Flutter and Dart installed. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/currency_converter_app.git
cd currency_converter_app
