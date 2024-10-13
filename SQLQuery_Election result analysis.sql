-- 1.Total seats
Select distinct COUNT(*) as Total_seats from constituencywise_results;

-- 2.What is the total number of seats available for elections in each state
Select s.State, COUNT(r.Leading_Candidate) as Total_seats 
from statewise_results as r
join States as s
On s.State_ID = r.State_ID
Group by s.State
Order by Total_seats desc;


-- 3.Total Seats Won by NDA Allianz

Select SUM(CASE
When Party IN(
           'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM') 
				then [Won]
				else 0
               End) as NDA_Total_seats
			   from partywise_results

-- 4.Seats Won by NDA Allianz Parties
Select Party as Party_name, Won from partywise_results
where Party In('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
Order by Won desc;


-- 5.Total Seats Won by I.N.D.I.A. Allianz

Select SUM(Case
		When Party
           In('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN [Won]
			Else 0
		End)
		from partywise_results


-- 6.Seats Won by I.N.D.I.A. Allianz Parties
Select Party as Party_name , Won from partywise_results
where Party In('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
				)
	Order by Won desc
						

-- 7.Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER
Alter table partywise_results 
Add party_alliance varchar(150);

Update partywise_results
Set party_alliance = 'I.N.D.I.A'
			Where Party In('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
				)

Update partywise_results
Set party_alliance = 'NDA'
			where party In('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')

Update partywise_results
Set party_alliance = 'Other'
		where party_alliance is Null

Select * from partywise_results;


-- 8.Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?
Select party_alliance, SUM(Won) as Seats_won from partywise_results
Group by party_alliance
Order by Seats_won desc;

-- 9.Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
Select cr.Winning_Candidate as Winning_candidates, pr.Party as Party_name, cr.Total_Votes as Total_votes, cr.Margin,
cr.Constituency_Name AS Constituency from constituencywise_results as cr
join partywise_results as pr
on cr.Party_ID = pr.Party_ID


-- 10.What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
Select cd.Candidate as Candidate, cd.EVM_Votes as EVM_Votes, cd.Postal_Votes as Postal_votes, cd.Total_Votes as Total_votes,
cr.Constituency_Name as Constituency from constituencywise_details as cd
join constituencywise_results as cr
on cd.Constituency_ID = cr.Constituency_ID



-- 11.Which parties won the most seats in s State, and how many seats did each party win?
Select Pr.Party as Party,COUNT(cr.Constituency_ID)  as Won from partywise_results as pr 
join constituencywise_results as cr 
on cr.Party_ID = pr.Party_ID
join statewise_results as sr
on cr.Parliament_Constituency = sr.Parliament_Constituency
join states as s
on sr.State_ID = s.State_ID
where s.State = 'Maharashtra'
Group by Party
Order by Won desc



-- 12.What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
Select s.State as States, 
SUM(Case when pr.party_alliance = 'NDA' then 1 else 0 End) as NDA_seats_won,
SUM(Case when pr.party_alliance = 'I.N.D.I.A' then 1 else 0 End) as INDIA_seats_won,
SUM(Case when pr.party_alliance = 'Other' then 1 else 0 End) as Other_seats_won
from states as s
join statewise_results as sr on s.State_ID = sr.State_ID
join constituencywise_results as cr on sr.Parliament_Constituency = cr.Parliament_Constituency
join partywise_results as pr on cr.Party_ID = pr.Party_ID
Group by s.State;



-- 13.Which candidate received the highest number of EVM votes in each constituency (Top 10)?
Select Top 10
cr.Constituency_Name as Constituency_Name , cd.Candidate as Candidate, cd.EVM_Votes as EVM_Votes from constituencywise_details as cd
join constituencywise_results as cr on cd.Constituency_ID = cr.Constituency_ID
Order by EVM_Votes desc



-- 14.Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?
  With Rankedcandidates as(
	Select 
		cd.Constituency_ID,
		cd.Party,
		cd.Candidate,
		cd.EVM_Votes,
		cd.Postal_Votes,
		Row_Number() Over (Partition by cd.Constituency_ID order by cd.EVM_Votes + cd.Postal_Votes desc) as VoteRank 
		From constituencywise_details as cd
		join constituencywise_results as cr 
		on cd.Constituency_ID = cr.Constituency_ID
		join statewise_results as sr
		on cr.Parliament_Constituency = sr.Parliament_Constituency
		join states as s
		on sr.State_ID = s.State_ID
		where s.State = 'Maharashtra'
		)

		Select cr.Constituency_Name, 
		MAX(CASE When rc.VoteRank = 1 then rc.candidate END) as Winning_Candidates,
		MAX(CASE When rc.VoteRank = 2 then rc.candidate END) as Runner_UP
		From constituencywise_results as cr
		join Rankedcandidates as rc
		on rc.Constituency_ID = cr.Constituency_ID
		Group by cr.Constituency_Name
		Order by cr.Constituency_Name


		Select * from constituencywise_results


