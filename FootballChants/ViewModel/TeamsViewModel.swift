//
//  TeamsViewModel.swift
//  Football Chants
//
//  Created by Tunde on 12/12/2020.
//

import Foundation

class TeamsViewModel {
    // private(set) - I can only change the team only within this class
    private(set) var teams: [Team] = [
        Team(id: .arsenal,
             name: "Arsenal",
             info: "Arsenal Football Club is a professional football club based in Islington, London, England, that plays in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, the League Centenary Trophy, one European Cup Winners' Cup, and one Inter-Cities Fairs Cup.",
             manager: .init(name: "Mikel Arteta", job: .manager),
             founded: "October 1886"),
        Team(id: .astonVilla,
            name: "Aston Villa",
             info: "Aston Villa Football Club is an English professional football club based in Aston, Birmingham. The club competes in the Premier League, the top tier of the English football league system. Founded in 1874, they have played at their home ground, Villa Park, since 1897. Aston Villa were one of the founder members of the Football League in 1888 and of the Premier League in 1992. Villa are one of only five English clubs to have won the European Cup, in 1981–82. They have also won the Football League First Division seven times, the FA Cup seven times, the League Cup five times, and the European (UEFA) Super Cup once.",
             manager: .init(name: "Dean Smith", job: .headCoach),
             founded: "November 1874"),
        Team(id: .brighton,
             name: "Brighton",
             info: "Brighton & Hove Albion Football Club, commonly referred to simply as Brighton, is an English professional football club based in the city of Brighton and Hove. They compete in the Premier League, the top tier of the English football league system. The club's home ground is the 30,750-capacity Falmer Stadium, situated in Falmer to the north east of the city.",
             manager: .init(name: "Graham Potter", job: .headCoach),
             founded: "June 1901"),
        Team(id: .burnley,
            name: "Burnley",
             info: "Burnley Football Club is an English association football club based in Burnley, Lancashire. Founded on 18 May 1882, it was one of the first to become professional (in 1883), and subsequently put pressure on the Football Association to permit payments to players. The club entered the FA Cup for the first time in 1885–86 and was one of the 12 founder members of the Football League in 1888–89. The team currently competes in the Premier League, the top tier of English football.",
             manager: .init(name: "Sean Dyche", job: .manager),
             founded: "May 1882"),
        Team(id: .chelsea,
            name: "Chelsea",
             info: "Chelsea Football Club are an English professional football club based in Fulham, London. Founded in 1905, the club competes in the Premier League, the top division of English football. Chelsea are among England's most successful clubs, having won over thirty competitive honours, including six league titles and six European trophies. Their home ground is Stamford Bridge.",
             manager: .init(name: "Frank Lampard", job: .headCoach),
             founded: "March 1905"),
        Team(id: .everton,
            name: "Everton",
             info: "Everton Football Club is an English professional football club based in Liverpool that competes in the Premier League, the top tier of English football. The club has competed in the top division for a record 117 seasons, missing only four top-flight seasons (1930–31, 1951–52, 1952–53, 1953–54) since the creation of the Football League, of which it was a founding member. Everton are the second-longest continuous serving club in English top flight football and has won nine league titles, five FA Cups, one European Cup Winners' Cup and nine Charity Shields.",
             manager: .init(name: "Carlo Ancelotti", job: .manager),
             founded: "1878"),
        Team(id: .fulham,
            name: "Fulham",
             info: "Fulham Football Club is an English professional association football club based in Fulham, London. They currently compete in the Premier League, the highest level of the English football league system. Founded in 1879, they are London's oldest football club playing professionally.",
             manager: .init(name: "Scott Parker", job: .headCoach),
             founded: "1879"),
        Team(id: .leeds,
            name: "Leeds",
             info: "Leeds United Football Club is an English professional football club based in the city of Leeds, West Yorkshire. The club was formed in 1919 following the disbanding of Leeds City by the Football League and took over their Elland Road stadium. The club currently competes in the Premier League, the top flight of English football, following promotion from the EFL Championship during the 2019—20 season. Most of their history has been spent competing in the first tier of English football. Their longest continuous spell inside the first tier was a period of 18 years between 1964 and 1982, while their longest period outside of it spanned 16 years between 2004 and 2020.",
             manager: .init(name: "Marcelo Bielsa", job: .headCoach),
             founded: "October 1919"),
        Team(id: .leicester,
            name: "Leicester",
             info: "Leicester City Football Club is an English professional football club based in Leicester in the East Midlands. The club competes in the Premier League, the top division of England's football league system, and plays its home matches at the King Power Stadium.",
             manager: .init(name: "Brendan Rodgers", job: .manager),
             founded: "1884"),
        Team(id: .liverpool,
            name: "Liverpool",
             info: "Liverpool Football Club is a professional football club in Liverpool, England, that competes in the Premier League, the top tier of English football. Domestically, the club has won nineteen League titles, seven FA Cups, a record eight League Cups and fifteen FA Community Shields. In international competitions, the club has won six European Cups, more than any other English club, three UEFA Cups, four UEFA Super Cups (also English records) and one FIFA Club World Cup.",
             manager: .init(name: "Jürgen Klopp", job: .manager),
             founded: "June 1892"),
        Team(id: .manchesterCity,
            name: "Manchester City",
             info: "Manchester City Football Club is an English football club based in Manchester that competes in the Premier League, the top flight of English football. Founded in 1880 as St. Mark's (West Gorton), it became Ardwick Association Football Club in 1887 and Manchester City in 1894. The club's home ground is the City of Manchester Stadium in east Manchester, to which it moved in 2003, having played at Maine Road since 1923. The club adopted their sky blue home shirts in 1894 in the first season of the club's current iteration, that have been used ever since.",
             manager: .init(name: "Pep Guardiola", job: .manager),
             founded: "1880"),
        Team(id: .manchesterUnited,
            name: "Manchester United",
             info: "Manchester United Football Club is a professional football club based in Old Trafford, Greater Manchester, England, that competes in the Premier League, the top flight of English football. Nicknamed \"the Red Devils\", the club was founded as Newton Heath LYR Football Club in 1878, changed its name to Manchester United in 1902 and moved to its current stadium, Old Trafford, in 1910.",
             manager: .init(name: "Ole Gunnar Solskjær", job: .manager),
             founded: "1902"),
        Team(id: .newcastle,
            name: "Newcastle United",
             info: "Newcastle United Football Club is an English professional football club based in Newcastle upon Tyne, Tyne and Wear, that plays in the Premier League, the top flight of English football. Founded in 1892 by the merger of Newcastle East End and Newcastle West End. The team plays its home matches at St. James' Park. Per the Taylor Report's requirement that all Premier League clubs have an all-seater stadium, the ground was adjusted in the mid-1990s and now has a capacity of 52,305.",
             manager: .init(name: "Steve Bruce", job: .manager),
             founded: "December 1892"),
        Team(id: .palace,
            name: "Crystal Palace",
             info: "Crystal Palace Football Club is a professional football club based in Selhurst, South London, England, who currently compete in the Premier League, the highest level of English football. Although their official founding date is 1905, the club claim to be a continuation of the original amateur Crystal Palace football club first established in 1861, which would make them the oldest professional football club in the world, after historians discovered a direct lineage through their ownership under the same Crystal Palace Company. Both the amateur and professional clubs played inside the grounds of the Crystal Palace Exhibition building, with the professional club playing at the FA Cup Final stadium until 1915, when they were forced to leave due to the outbreak of the First World War. In 1924, they moved to their current home at Selhurst Park.",
             manager: .init(name: "Roy Hodgson", job: .manager),
             founded: "September 1905"),
        Team(id: .sheffield,
            name: "Sheffield United",
             info: "Sheffield United Football Club is a professional football club in Sheffield, South Yorkshire, England, which competes in the Premier League, the top division of English football. They formed in 1889, as an offshoot of Sheffield United Cricket Club, and are nicknamed The Blades due to Sheffield's history of steel production. They have played home games at Bramall Lane since their formation.",
             manager: .init(name: "Chris Wilder", job: .manager),
             founded: "March 1889"),
        Team(id: .southampton,
            name: "Southampton",
             info: "Southampton Football Club is an English professional football club based in Southampton, Hampshire, which plays in the Premier League, the top tier of English football.",
             manager: .init(name: "Ralph Hasenhüttl", job: .manager),
             founded: "November 1885"),
        Team(id: .tottenham,
            name: "Tottenham Hotspurs",
             info: "Founded in 1882, Tottenham won the FA Cup for the first time in 1901, the only non-League club to do so since the formation of the Football League in 1888. Tottenham were the first club in the 20th century to achieve the League and FA Cup Double, winning both competitions in the 1960–61 season.",
             manager: .init(name: "José Mourinho", job: .manager),
             founded: "September 1882"),
        Team(id: .westBrom,
            name: "West Brom",
             info: "West Bromwich Albion Football Club (/ˈbrɒmɪdʒ, -ɪtʃ/) is an English professional football club based in West Bromwich, West Midlands, England, that competes in the Premier League, the top tier of English football. The club was formed in 1878 and has played at its home ground, The Hawthorns, since 1900.",
             manager: .init(name: "Slaven Bilić", job: .manager),
             founded: "1878"),
        Team(id: .wolves,
            name: "Wolves",
             info: "Wolverhampton Wanderers Football Club, commonly known as Wolves, is a professional association football club based in the city of Wolverhampton in the West Midlands, England. Formed as St. Luke's F.C. in 1877, the club has played at Molineux Stadium since 1889 and has been competing in the Premier League, the top division of English football, since winning promotion in 2018. The 2020–21 season is the club's 66th season in total at the highest level.",
             manager: .init(name: "Nuno Espírito Santo", job: .headCoach),
             founded: "1877"),
        ]
    func togglePlayback(for team: Team) {
        teams.forEach { item in
            if item.id == team.id {
                item.isPlaying.toggle()
            } else {
                item.isPlaying = false
            }
        }
    }

}
