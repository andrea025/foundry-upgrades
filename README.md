# Foundry UUPS Upgradeable Contracts

This is a project from the Cyfrin Foundry Solidity Course.

*This is for demo purposes only. Upgradeable contracts are a menance and in general should be avoided for 


- [Foundry UUPS Upgradeable Contracts](#foundry-uups-upgradeable-contracts)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
- [Usage](#usage)
  - [Testing](#testing)
    - [Test Coverage](#test-coverage)
- [Formatting](#formatting)

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Quickstart

```
git clone https://github.com/andrea025/foundry-upgrades
cd foundry-upgrades
forge build
```


# Usage

## Testing

```
forge test
```

### Test Coverage

```
forge coverage
```

and for coverage based testing: 

```
forge coverage --report debug
```


# Formatting


To run code formatting:
```
forge fmt
```
