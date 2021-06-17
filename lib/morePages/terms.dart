import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ritech/Config/colors.dart';

class TermsAndConditions extends StatefulWidget {
  TermsAndConditions({Key key}) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
              child: Container(
                color: Color(0xFF0F2F2F2),
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          leading: Container(
            height: 3,
            width: 3,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.fromLTRB(20, 2, 0, 2),
            decoration:
                BoxDecoration(color: kHomeColor, shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/back-n.svg",
                  color: kPrimaryColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          title: Text(
            "Terms and conditions",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Muli",
              fontWeight: FontWeight.w800,
              color: Color(0xFF05242C),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This document sets out the terms and conditions on which we, Recycling investment technological business world (RITECH) enable you to invest via our website (www.site.com). Please read these Investor Terms and Conditions carefully before using the Website. By using the Website, you agree to be irreconcilably bound by these Investor Terms and Conditions and our Privacy Policy",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "BACKGROUND",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Muli",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'RITECH, through the Website, is providing information on property/currency backed investment opportunities. The Website hosts investments by way of acquiring a share in a property (“Property Equity Investments”) and property backed debt investments (“Property Debt Investments”). Property Equity Investments and Property Debt Investments, together “Property Partner Investments” and each a “Property Partner Investment”.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'RITECH operates a secondary market which is authorized and regulated by the FCA as a ‘multilateral trading facility’ (the “Resale Market”). Certain RITECH Investments may be bought and sold by Investors on the Resale Market pursuant to the rules of the Resale Market.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'RITECH Investments are hosted on the Website as either ‘new listing’ fund raisings marking the first time an investment opportunity is made available to Investors (“New Listing”) or secondary market investment opportunities via trading on the Resale Market.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'In respect of both Property Equity Investments and Property Debt Investments, we will conduct a ‘new listing’ fundraising round (the "Investment Round") through the Website pursuant to which we are looking to raise a pre-agreed minimum amount for each Property Equity Investment or Property Debt Investment (as the case may be) from various Investors.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'RITECH prepares an investment case for each RITECH Investment (“Investment Case”). It is important that you read and understand the Investment Case before making an investment. ',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If the Total Investment Required in relation to a specific Property Partner Investment is not achieved, all committed funds are returned to you without deduction of any fees or expenses.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'RITECH will operate the Website and, in accordance with these Investor Terms and Conditions, allow you to access the Website and use the functions available on the Website. Where you make a Property Partner Investment through the Website, RITECH will also co-ordinate the payment and collection of sums due from Investors',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If there are any deviations from these Investor Terms and Conditions, they will be made clear either via specific terms and conditions or in the Investment Case, and such specific terms and conditions or the Investment Cases shall take precedence.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'PERIODIC STATEMENTS AND VALUATIONS',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Muli",
                    color: Color(0xFF05242C),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'You will be provided with information on your RITECH Investments, including monthly dividends, an estimated valuation of your Property Equity Investment. However, we provide no warranty or assurances as to the accuracy of this information other than required under the FCA rules.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'You will be provided with an estimated valuation of your Property Equity Investment in the SPV, which will consist of the latest valuation of the property plus unamortized purchase costs less deferred tax and any other liabilities in the SPV (on a per share basis).',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'The basis for the latest valuation of the property is currently as follows:',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'For New Listings this will be the proposed investment purchase price, which in turn is supported by an independent chartered physical inspection and valuation;',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Thereafter, the investment valuation is updated in line with an independent RICS accredited assessment on at least an annual basis for all Property Equity Investments trading on the Resale Market; and',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'periodically physical inspection and valuation is performed to provide a further update to the valuation and forms the basis for the five yearly exit protections.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'RETURN ON YOUR INVESTMENT',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Muli",
                    color: Color(0xFF05242C),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Once you have made a Property Equity Investment and purchased Shares, any distribution declared at the sole discretion of the directors of the SPV and which you receive from the SPV will be paid to you and placed in your Account, the balance of which will be visible to you on the Website, via your Account dashboard as ‘Available Funds’.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Any dividends you receive will be rounded down to the nearest penny',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Once you have made a Property Debt Investment and been issued your bonds, unless otherwise specified in the terms and conditions applicable to a specific Property Debt Investment, your return on investment, capital plus accrued interest, will be paid to you and placed in your Account following the end of the term of the bond instrument pursuant to which your bonds have been issued to you.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Subject to completion of ‘know-your-customer’ and anti-money laundering processes (including bank account verification), you may then choose to withdraw money at any time, or re-invest in other Property Partner Investments in a similar manner as set out in these Investor Terms & Conditions.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'You may have to pay other taxes or costs, which are not imposed by us. You should seek your own independent tax advice, where necessary.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'CAPITAL AT RISK',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Muli",
                    color: Color(0xFF05242C),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We wish to draw your attention to the risks relating to investing in RITECH Investments, which can be found on our Website.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Each subscriber expressly agrees that use of the service is at subscriber’s sole risk. the service is provided on an “as is” and “as available” basis. RITECH disclaims all warranties of any kind, express or implied by law, custom or otherwise. RITECH makes no warranty regarding any services purchased or obtained through the program or any transactions entered into through the program.  neither RITECH nor any of its members, subsidiaries, publishers, service providers, licensors, officers, directors or employees shall be liable for any direct, indirect, incidental, special or consequential damages arising out of or relating to this investment, or resulting from the use or the inability to use the service or messages received or transactions entered into through the platform or resulting from unauthorized access to or alteration of subscriber’s transmissions or data, including but not limited to, damages for loss of profits or capital, use, data or other intangible, even if such party has been advised of the possibility of such damages or not.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'To prevent unauthorized access, maintain data accuracy, and ensure the correct use of information, RITECH uses appropriate industry standard procedures to safeguard the confidentiality of the Subscriber’s personal information, such as SSL, firewall, encryption, token authentication, application proxies, monitoring technology, and adaptive analysis of the Website’s traffic to track abuse of the RITECH Website and its data. However, no data transmitted over the Internet can be 100% secure. As a result, while RITECH strives to protect its Subscribers’ personal information, RITECH cannot guarantee the security of any information that Subscribers transmit through a third party.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'The value of your RITECH Investment is valued monthly by 15%.  Past performance is not a reliable indicator of future performance. Forecasts or projections of future performance, if stated, are not a reliable indicator of future performance; these are not guarantees and are subject to change. Interest and capital returned may be lower than expected. Gross rent, dividends, and capital growth may be lower than estimated.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'RITECH does not provide tax or investment advice and any information provided is for informational purposes and is provided to help you make your own informed decisions. Such information does not constitute a recommendation to invest in a particular Property Partner Investment. Investors are advised to obtain appropriate tax or investment advice where necessary.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'The Financial Services Compensation Scheme("FSCS") protects the cash held in your Account; however, your Property Partner Investments are not protected by the FSCS in the event that you do not receive back the amount that you have invested.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'TERMINATION AND VARIATION',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Muli",
                    color: Color(0xFF05242C),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'There is no minimum duration of this agreement and termination of this agreement will only occur:',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'If you withdraw your money from your Account and close your Account with us in which case were serve the right to retain certain data to comply with our regulatory obligations; or',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Muli",
                    color: Color(0xFF05242C),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'at such other time as we decide.',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Muli",
                    color: Color(0xFF05242C),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We may update these Investor Terms and Conditions from time to time to reflect any changes in law or the operation of the Website or for any other reason (acting reasonably), including but not limited to, changes to our product offering or fees.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If we update these Investor Terms and Conditions, we will inform you as soon as practical whether by email or an alternative method such as uploading to the Website. We will endeavour to provide you with reasonable advance notice of any changes in order to give you the opportunity to review such changes. Please note, however, that certain changes, including changes addressing new product offerings or changes made for legal or regulatory reasons maybe effective immediately.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'By continuing to use the Website and/or our services, you will be deemed to have agreed to the updated Investor Terms and Conditions.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If there is a conflict between any versions of the Investor Terms and Conditions to which you have agreed, or deemed to have agreed to, the most recent version shall take precedence unless it is expressly stated otherwise.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'REGULATORY PROVISIONS',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Muli",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Client categorization',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Muli",
                    color: Color(0xFF05242C),
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),
              Text(
                'RITECH has categorized you as are tail client under the FCA rules. You may request re-categorization as a professional client under FCA rules, but any Sucher- categorization will be conditional up on you meeting various tests required by the FCA. If you are re-categorized as a professional client, it would also mean that there would be limitations to the level of client protections with which you would be provided than if you remained as a retail client. We will provide you with more information relating to being reclassified as a professional client upon request.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Best Execution',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Muli",
                    color: Color(0xFF05242C),
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),
              Text(
                "RITECH shall provide best execution in accordance with the FCA rules. A best execution policy has been implemented in order to ensure that RITECH takes all reasonable steps to obtain best execution i.e., the best possible result for you when arranging deals in investments, taking into account the FCA's execution factors of price, costs, speed, likelihood of execution and settlement, size, nature of the order and any other consideration relevant to the execution of an order. RITECH may revise its best execution policy from time to time. The best execution policy is available on request.",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Transactions in RITECH Investments take place through the Website.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Investments made via the Resale Market result in the execution of trades via a multilateral trading facility (MTF).',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Conflicts of Interest',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Muli",
                    color: Color(0xFF05242C),
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),
              Text(
                'We are required to have arrangements in place to manage conflicts of interest between our Investors and us and between our different Investors.  We have put in place a Conflicts of Interest Policy which identifies those situations giving rise to actual or potential conflicts of interest and which provides details of how such conflicts are managed.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Where the arrangements under our Conflicts of Interest Policy are not sufficient to ensure, with reasonable confidence, that risks of damage to the interests of our Investors will be prevented, we will disclose sufficient details of the actual or potential conflict to you in order to enable you to take an informed decision as to whether to continue to deal with us notwithstanding the existence of such conflict. We will provide you with a summary of our Conflicts of Interest Policy upon request.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'COMPLAINTS PROCEDURE AND COMPENSATION',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Muli",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Should you have any complaints regarding our service you should put your concerns in writing to us, setting out the details of your complaint, to the registered office of RITECH or via email at ⦁	support@propertypartner.co.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Our senior management will consider and investigate each complaint carefully and promptly. We will aim to provide you with a final response or a written response explaining why we are not in a position to make a final response, within 14 days of receipt of your complaint, but no later than 8weeks.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'RITECH is covered by the Financial Services Compensation Scheme ("FSCS"), which will protect sums held in your Account i.e.  sums not yet invested in RITECH. The FSCS can pay compensation if RITECH or any third-party bank cannot meet an obligation owed to an “eligible claimant”.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If we fail to insist on your strict performance of these Investor Terms and Conditions or if we fail to exercise any of our rights or remedies to which we are entitled under these Investor Terms and Conditions, or any other document referred to herein, this will not amount to a waiver of such rights or remedies nor will it relieve you of your obligations under these terms and conditions.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'No full or partial waiver of any such right or remedy shall restrict us from exercising that right or remedy, or any other right or remedy, in the future',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If any of these Investor Terms and Conditions or any provisions of any other document featured as part of your relationship with us are determined by a competent authority to be invalid, unlawful or unenforceable, to any extent, then such term or condition will be severed from the remaining Investor Terms and Conditions which will continue to be valid, as far as permitted by English law.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nothing in these Investor Terms and Conditions is intended to or will be used to establish any partnership or joint venture between the parties, nor authorize any party to make any commitments for or on behalf of any other party',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'You should take your own tax advice. No warranty or representation is made in relation to your tax position, which will apply to you following the making of any RITECH Investment',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Any notice or other communication given to either party in connection with this contract shall be in writing and delivered by hand or sent by pre-paid first-class post (or an equivalent next day delivery service) at its registered address (if a company) or its principal place of business or residential address (if an individual), or sent by email to the email address notified to the other party in accordance with this contract. Our e-mail address for the service of notice sis ⦁	notices@⦁	ritech⦁	.co. Any notice or other communication will be deemed to have been received if delivered by hand, on signature of delivery receipt or at the time the notice is left at the proper address, or if sent by email. ',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'All correspondence and communication between you and us will be in the English language.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Any dispute or claim arising out of or in connection with the Website, its subject matter or formation will be governed by English law and such disputes or claims will be subject to the non-exclusive jurisdiction of the Courts',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'These Investor Terms and Conditions and any document expressly referred to in them constitute the whole agreement between us and supersedes all previous discussions, correspondence, negotiations or agreement relating to this subject matter.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
