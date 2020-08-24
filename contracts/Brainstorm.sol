address public borrower;
uint256 public principal;
uint256 public length;
uint256 public rate;
uint256 public expiry;
bool public approved;
IERC20 public token;

A LoanToken represents a share of an un-collateralized loan.

borrower, principal, length, rate

4 Phases:

I. "Fundrasing"
    -> Mint/Burn Loan Tokens is enabled
    - Depositors can send deposit tokens to contract
        -> mint LoanTokens equal to deposit
    - Can never deposit more than the principal
        -> Return amount over principal if sending more than principal
    - Fundraising is complete once we reach principal amount
    - During fundraising, can exchange LoanTokens for deposit tokens
        -> Funds aren't locked until Lending Phase

II. "Approval"
    - Once smart contract has principal amount of deposit tokens:
        -> Borrower can call a function to approve the loan
        -> Approving the loan withdraws funds to borrower address
        -> Loan expiry is set to: block.timestamp + length
        -> Mint/Burning Loan tokens is disabled

III. "Lending"
    - Here we're waiting for block.timestamp > expiry
    - Mint/Burning Loan tokens is disabled
    - Borrower can pay back deposit tokens at any time (but cannot withdraw)

IIII. "Complete"
    - Once timestamp > expiry, we enter the complete phase
    - Burning enabled (Minting disabled)
    - LoanTokens can be burned in exchange for a share of the deposit tokens in contract
    - Ideally borrower would have paid back (principal + principal * rate)


Notes:
    - Should we set a time limit on fundraising period
    - Should we lock funds during time limit



^^ Pool 1 ^^
Main Goals:
- increase market cap of TUSD
- provide utility for TRU


- Manage and approve loans
- Loans are approved through TRU stakers

- Hand select and whitelist 3-4 borrowers that we trust 
- With every loan we create, we create a legal agreement
- Borrowers apply for a loan by deploying a LoanToken
    -> Interface for borrowers to apply web3 application

Staking:
- Anyone can provide liquidity in TUSD in pool
- Anyone can stake TRU on pool

Voting:
- If you YES to approve a loan, TRU is locked for the period the loan
    -> if loan is successful, you get back TRU + substantial reward of TRU (maybe TUSD)
    -> if loan is unsuccessful, BURN TRU
- If you vote
- Incentivise people who vote on good loans, publish people who vote on bad loans
- Proposal:
    -> Voting power = floor(TRU, TUSD)
                 floor(10, 100)  = 10
                 floor(100, 10)  = 10
                 floor(100, 100) = 100

Liquidity Mining:
- Airdrop tokens to people who provide liquidity






























