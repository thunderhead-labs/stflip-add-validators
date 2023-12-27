# NOTICE
If you are not 100% comfortable on how to use this tool, then please reach out and someone from the Thunderhead team will assist. This operation is irreversible and it is super annoying if an operator adds their validators incorrectly. 

Only proceed to the following steps if you are 100% certain that you know what you are doing, otherwise reach out for support. 

# Add Your Validators to StakedFLIP

## Install Foundry
[Install](https://book.getfoundry.sh/getting-started/installation) Foundry by doing:

`curl -L https://foundry.paradigm.xyz | bash`

## Add your addresses  
Open the `src/AddValidators.s.sol` file and input the hex version of your validator addresses into the script. Ensure that the array length matches how many validators you have. 

## Run the Script

Enter:

`forge script script/AddValidators.s.sol --rpc-url https://rpc.ankr.com/eth  --mnemonic-derivation-paths "m/44'/60'/0'/0/8" --trezor`

Specifying your hardware wallet and derivation path. 
