// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import {Reward} from "./Reward.sol";
import {IVotingEscrow} from "../interfaces/IVotingEscrow.sol";
import {IVoter} from "../interfaces/IVoter.sol";

/// @title Base managed veNFT reward contract for distribution of rewards by token id
abstract contract ManagedReward is Reward {
    constructor(address _voter) Reward(_voter) {
        address _ve = IVoter(_voter).ve();
        address _token = IVotingEscrow(_ve).token();
        rewards.push(_token);
        isReward[_token] = true;

        authorized = _ve;
    }

    /// @inheritdoc Reward
    function getReward(uint256 tokenId, address[] memory tokens) external virtual override {}

    /// @inheritdoc Reward
    function notifyRewardAmount(address token, uint256 amount) external virtual override {}
}