pragma solidity 0.8.13;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IVelo is IERC20 {
    function mint(address, uint256) external returns (bool);

    function minter() external returns (address);
}