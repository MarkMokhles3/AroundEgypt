//
//  Experiences.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 06/09/2025.
//


import Foundation

// MARK: - Experiences
struct Experiences: Codable {
    var meta: Meta?
    var data: [ExperienceData]?
    var pagination: Pagination?
}

// MARK: - Datum
struct ExperienceData: Codable {
    var id, title: String?
    var coverPhoto: String?
    var description: String?
    var viewsNo, likesNo, recommended, hasVideo: Int?
    var tags: [City]?
    var city: City?
    var tourURL: String?
    var tourHTML: String?
    var tourXML: String?
    var famousFigure: String?
    var founded, detailedDescription, address: String?
    var gmapLocation: GmapLocation?
    var translatedOpeningHours: Pagination?
    var reviews: [Review]?
    var rating, reviewsNo: Int?
    var audioURL: String?
    var hasAudio: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case coverPhoto = "cover_photo"
        case description
        case viewsNo = "views_no"
        case likesNo = "likes_no"
        case recommended
        case hasVideo = "has_video"
        case tags, city
        case tourURL = "tour_url"
        case tourHTML = "tour_html"
        case tourXML = "tour_xml"
        case famousFigure = "famous_figure"
        case founded
        case detailedDescription = "detailed_description"
        case address
        case gmapLocation = "gmap_location"
        case translatedOpeningHours = "translated_opening_hours"
        case reviews, rating
        case reviewsNo = "reviews_no"
        case audioURL = "audio_url"
        case hasAudio = "has_audio"
    }
}

// MARK: - City
struct City: Codable {
    var id: Int?
    var name: String?
    var topPick: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case topPick = "top_pick"
    }
}

// MARK: - Era
struct Era: Codable {
    var id, value, createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, value
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - GmapLocation
struct GmapLocation: Codable {
    var type: TypeEnum?
    var coordinates: [Double]?
}

enum TypeEnum: String, Codable {
    case point = "Point"
}

// MARK: - OpeningHours
struct OpeningHours: Codable {
    var sunday, monday, tuesday, wednesday: [String]?
    var thursday, friday, saturday: [String]?
}

// MARK: - Review
struct Review: Codable {
    var id, experience, name: String?
    var rating: Int?
    var comment, createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, experience, name, rating, comment
        case createdAt = "created_at"
    }
}

// MARK: - TicketPrice
struct TicketPrice: Codable {
    var type: String?
    var price: Int?
}

// MARK: - TranslatedOpeningHours
struct TranslatedOpeningHours: Codable {
    var sunday, monday, tuesday, wednesday: FridayClass?
    var thursday, friday, saturday: FridayClass?
}

// MARK: - FridayClass
struct FridayClass: Codable {
    var day: DayEnum?
    var time: String?
}

enum DayEnum: String, Codable {
    case friday = "Friday"
    case monday = "Monday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    case thursday = "Thursday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
}

// MARK: - Meta
struct Meta: Codable {
    var code: Int?
    var errors: [String]?
}

// MARK: - Pagination
struct Pagination: Codable {
}

struct MockData {
    static let Experiences = [philaeTemple, komOmboTemple, qaitbayCitadel]
    static let philaeTemple = ExperienceData(id: "7351979e-7951-4aad-876f-49d5027438bf",
                                             title: "Temple of Isis (Philae)",
                                             coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/21/DBiLufkgRD42qnvG83yuJzXiaV2NVp-metad214aWhEdnY2T2dvTzRobXRNcThkRXZOTk5sMjh5SVZCMW5BV2ZsMi5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250908%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250908T144448Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=cafe433734e63b52865a4529b66b650acbc11dcb9c0d8f20760b52470e8dbfce",
                                             description: "Philae is currently an island in the reservoir of the Aswan Low Dam, downstream of the Aswan Dam and Lake Nasser, Egypt. Philae was originally located near the expansive First Cataract of the Nile River in southern Egypt, and was the site of an Ancient Egyptian temple complex. These rapids and the surrounding area have been variously flooded since the initial construction of the Old Aswan Dam in 1902. The temple complex was later dismantled and relocated to nearby Agilkia Island as part of the UNESCO Nubia Campaign project, protecting this and other complexes before the 1970 completion of the Aswan High Dam.",
                                             viewsNo: 15181,
                                             likesNo: 1383,
                                             recommended: 0,
                                             hasVideo: 0,
                                             tags: [],
                                             city: City(id: 10,
                                                        name: "Aswan",
                                                        topPick: 0),
                                             tourHTML: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/1586027305vtour/vtour/tour.html",
                                             famousFigure: "Goddess ISIS, Hathor & Trajan",
//                                             period: nil,
//                                             era: Era(id: "addd0cc9-6b09-4364-8586-cab96fa67023",
//                                                      value: "Ptolemaic",
//                                                      createdAt: "2023-10-08T12:39:59.000000Z",
//                                                      updatedAt: "2023-10-12T08:40:11.000000Z"),
                                             founded: "",
                                             detailedDescription: "Built to honor the goddess Isis, this was the last temple built in the classical Egyptian style. Construction began around 690 BC, and it was one of the last outposts where the goddess was worshiped. The cult of Isis continued here until at least AD 550. The boat leaves you near the Kiosk of Nectanebo, the oldest part, and the entrance to the temple is marked by the 18m-high first pylon with reliefs of Ptolemy XII Neos Dionysos smiting enemies. In the central court of the Temple of Isis, the mammisi (birth house) is dedicated to Horus, son of Isis and Osiris. Successive pharaohs reinstated their legitimacy as the mortal descendants of Horus by taking part in rituals celebrating the Isis legend and the birth of her son Horus in the marshes. \n\nThe second pylon leads to a hypostyle hall, with superb column capitals. Note also the reuse of the temple as a Christian church, with crosses carved into the older hieroglyph reliefs, and images of the Egyptian gods carefully defaced. Beyond lie three vestibules, leading into the Inner Sanctuary of Isis. Two granite shrines stood here, one containing a gold statue of Isis and another containing the barque in which the statue traveled, but these were long ago moved to Florence and Paris, and only the stone pedestal for the barque remains, inscribed with the names of Ptolemy III and his wife, Berenice. Take a side door west out of the hypostyle hall to the Gate of Hadrian where there is an image of the god Hapi, sitting in a cave at the First Cataract, representing the source of the river Nile.\n\nEast of the second pylon is the delightful Temple of Hathor, decorated with reliefs of musicians (including an ape playing the lute) and Bes, the god of childbirth. South of this is the elegant, unfinished pavilion by the water’s edge, known as the Kiosk of Trajan (‘Pharaoh’s Bed’), perhaps the most famous of Philae’s monuments and one that was frequently painted by Victorian artists, whose boats were moored beneath it.\n\nThe whole complex was moved from its original location on Philae Island, to its new location on Agilkia Island, after the flooding of Lake Nasser. A major multinational UNESCO team relocated Philae, and a number of other temples that now dot the shores of Lake Nasser. You can see the submerged original island a short distance away, punctuated by the steel columns used in the moving process.",
                                             address: "Agelika Island, Aswan",
                                             gmapLocation: nil,
//                                             openingHours: nil,
                                             translatedOpeningHours: nil,
//                                             startingPrice: 5,
//                                             ticketPrices: nil,
//                                             isLiked: nil,
                                             reviews: [Review(id: "4646d2ee-2be9-4bb9-9cc6-4a880772cd65",
                                                              experience: "Temple of Isis (Philae)",
                                                              name: "Dodo",
                                                              rating: 1,
                                                              comment: "I never went yet so please and my mom has no money",
                                                              createdAt: "July 2025")],
                                             rating: 1,
                                             reviewsNo: 1,
                                             audioURL: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/22/R1x14SrTCi1aasn4s2mHbfWdQkdb5I-metaMjUtVGVtcGxlLW9mLUlzaXMtKFBoaWxhZSlfMDEtVjIubXAz-.mp3",
                                             hasAudio: true)
    
    
    static let komOmboTemple = ExperienceData(id: "bdd85830-3f25-4ecb-a433-43178a515c37",
                                              title: "Kom Ombo Temple",
                                              coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/51/VGaX2MatfRrmisLpAwch92Za4jjuNB-metaYjdtQm9mT2VLOUFWa2hScXFGWmlsUmxOWjlLU0lNdG5NcWM3dnVSUS5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250906%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250906T142418Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=f0dd4d24190ac2e5098bb6df890e37d4744ad22533a19329e8fa94dffe4737ea",
                                              description: "The Temple of Kom Ombo is an unusual double temple in the town of Kom Ombo in Aswan Governorate, Upper Egypt. It was constructed during the Ptolemaic dynasty, 180–47 BC. Some additions to it were later made during the Roman period.",
                                              viewsNo: 29951,
                                              likesNo: 1786,
                                              recommended: 0,
                                              hasVideo: 0,
                                              tags: [],
                                              city: City(id: 10,
                                                         name: "Aswan",
                                                         topPick: 0),
                                              tourHTML: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/1588598739vtour/vtour/tour.html",
                                              famousFigure: "Sobek, Horus & Hathor",
//                                              period: nil,
//                                              era: Era(id: "addd0cc9-6b09-4364-8586-cab96fa67023",
//                                                       value: "Ptolemaic",
//                                                       createdAt: "2023-10-08T12:39:59.000000Z",
//                                                       updatedAt: "2023-10-12T08:40:11.000000Z"),
                                              founded: "",
                                              detailedDescription: "Built to overlook the Nile, the temple is located in the city of Kom Ombo, about 30 miles North of Aswan. Its dual design is dedicated to Sobek and Horus and is perfectly symmetrical along its main axis. Kom Ombo was dedicated mainly to Sobek and Horus; however, some of their family members were part of the temple’s dedication as well. The Southern portion of the temple was not just dedicated to Sobek, the god of fertility, but also to Hathor, the goddess of love and joy, and Khonsu, the god of the moon. In this portion of the temple there are many crocodile representations to pay homage to Sobek. This part of the temple is also called “House of the Crocodile.” The Northern portion of the temple was dedicated mainly to Horus, god of the sun, and also Tasenetnofret, meaning “the good sister,” and a manifestation of Hathor, and Panebtaway, meaning “the Lord of two lands” which represented Egyptian kingship. In this part of the temple, there are many representations of falcons to pay homage to the falcon-headed god, Horus. This part of the temple is also called “Castle of the Falcon.” Just after crossing the gate inside the temple, there is a small room dedicated to Hathor. Today, it is used to display the many mummified crocodiles that were found in the temple’s vicinity. A well in front of the main entrance was once used as a Nilometer. The first pylon, which has since been destroyed, now consists only of foundation stones and a portion of a wall. Entering into the main court, there are 16 painted columns, eight on each side of the court. A granite altar sits in the center of the main court, likely where the sacred boat was placed. On the rear wall of the main court are five lotus-shaped columns along with a screen wall. Two entrances, one for each deity, open up here. Through both entrances lies the first Hypostyle hall. There are ten lotus-shaped columns here with the middle two separating the two halves of the hall. Separate entrances guide visitors into the second Hypostyle hall known as “The Hall of Offering”. Beyond this Hall of Offering are three antechambers, now all nearly destroyed. Curiously, the twin sanctuaries which are found beyond the antechambers are separated by a hidden chamber. A dual passageway runs the perimeter of the entire temple and there are seven additional rooms along the interior passage. A staircase leads to the roof.",
                                              address: "It is located in Kom Ombo, 46 ​​km north of Aswan",
                                              gmapLocation: nil,
//                                              openingHours: nil,
                                              translatedOpeningHours: nil,
//                                              startingPrice: 5,
//                                              ticketPrices: nil,
//                                              isLiked: nil,
                                              reviews: [],
                                              rating: 0,
                                              reviewsNo: 0,
                                              audioURL: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/22/R1x14SrTCi1aasn4s2mHbfWdQkdb5I-metaMjUtVGVtcGxlLW9mLUlzaXMtKFBoaWxhZSlfMDEtVjIubXAz-.mp3",
                                              hasAudio: true)
    
    static let qaitbayCitadel = ExperienceData(id: "78a56ac0-230e-44c1-986a-95316a506a12",
                                               title: "Qaitbay Citadel",
                                               coverPhoto: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/23/tSWxkRzwQylxAuugB2CqOWzOpQ24M8-metaRjk3NzJYaXFDZXlscUtuZjJiYTQ0b05LZ3dUdTdwZVc4ZnhxUkVLdC5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250906%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250906T142418Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=8b9920cdd6f7001f5d38bae313d07c7f1a333b8ee14cb3a9956c821b7da9d29c",
                                               description: "The Citadel of Qaitbay is a 15th-century defensive fortress located on the Mediterranean sea coast, in Alexandria, Egypt. It was established in 1477 AD by Sultan Al-Ashraf Sayf al-Din Qa'it Bay.",
                                               viewsNo: 19072,
                                               likesNo: 1027,
                                               recommended: 0,
                                               hasVideo: 0,
                                               tags: [],
                                               city: City(id: 11,
                                                          name: "Alexandria",
                                                          topPick: 0),
                                               tourHTML: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/1586025224vtour/vtour/tour.html",
                                               famousFigure: "Sultan Al-Ashraf Sayf al-Din Qa'it Bay.",
//                                               period: nil,
//                                               era: Era(id: "9d1eda6e-7ee4-4c6e-ae39-2985c6d3e12d",
//                                                        value: "15th Century",
//                                                        createdAt: "2023-10-08T12:37:28.000000Z",
//                                                        updatedAt: "2023-10-12T08:40:11.000000Z"),
                                               founded: "",
                                               detailedDescription: "The Citadel is situated at the entrance of the eastern harbor on the eastern point of the Pharos Island. It was erected on the exact site of the famous Lighthouse of Alexandria, which was one of the Seven Wonders of the Ancient World. The lighthouse continued to function until the time of the Arab conquest, then several disasters occurred and the shape of the lighthouse was changed to some extent, but it still continued to function. Restoration began in the period of Ahmed Ibn Tulun (about 880 AD). During the 11th century an earthquake occurred, causing damage to the octagonal part. The bottom survived, but it could only serve as a watchtower, and a small mosque was built on the top. In the 14th century there was a very destructive earthquake and the whole building was completely destroyed.\n\n15th-century fortifications\nAbout 1480 AD, the Circassian Mameluke Sultan Al-Ashraf Qaitbay fortified the place as part of his coastal defensive edifices against the Turks, who were threatening Egypt at that time. He built the fortress and placed a mosque inside it. The Citadel continued to function during most of the Mameluke period, the Ottoman period and the Modern period, but after the British bombardment of Alexandria in 1882, it was kept out of the spotlight. It became neglected until the 20th century, when it was restored several times by the Egyptian Supreme Council of Antiquities.\n\nThe founder of the Citadel of Qaitbay is a Circassian Sultan named Al-Ashraf Abou Anasr Saif El-Din Qaitbay El-Jerkasy Al-Zahiry (1468–1496 AD) who was born about 1423 AD (826 AH). He was a Mamluke who had come to Egypt as a young man, less than 20 years old. Bought by Al-Ashraf Bersbay, he remained among his attendants until Al-Ashraf Bersbay died. Then the Sultan Jaqmaq bought Qaitbay, and later gave him his freedom. Qaitbay then went on to occupy various posts. He became the Chief of the Army (Atabec Al-Askar) during the rule of the Sultan Timurbugha. When the Sultan was dethroned, Qaitbay was appointed as a Sultan who was titled Almalek Al-Ashraf on Monday 26th Ragab, 872 AH (1468 AD). He was one of the most important and prominent Mameluke Sultans, ruling for about 29 years. He was a brave king, who tried to initiate a new era with the Ottomans by exchanging embassies and gifts. He was fond of travel and made many prominent journeys.\n\nThe edifice's mason\nQaitbay was so fond of art and architecture that he created an important post among the administrative system of the state; it was the Edifices Mason (Shady Al-Ama'er). He built many beneficial constructions in Mecca, Medina, and Jerusalem. In Egypt there are about 70 renovated edifices attributed to him, among them are Mosques, Madrasas, Agencies, Fountain houses (Sabils), Kuttabs, houses, military edifices like the Citadels in Alexandria and Rosetta (Nowadays the city of Rashid). These Citadels were built to protect the north of Egypt, mainly against the Ottomans, whose power was increasing in the Mediterranean.\n\nQagmas Al-Eshaqy, The Edifices Mason, was the architect of the Citadel. Before his arrival in Egypt he was a Mameluke of Djakmaq in Syria. During the rule of Qaitbay he became the edifices mason, and then the Viceroy of Alexandria. He was appointed governor of Syria (Damascus), built a Mosque outside the gate of Rashid (Bab Rashid) as well as a Cenotaph and a Khan. He also renovated the Mosque of El-Sawary outside the gate of Sadrah (Bab Sadrah).\n\nQagmas was intelligent and modest, as well as the overseer of many constructions during the time of Qaitbay. In 882 AH (1477 AD) the Sultan Qaitbay visited the site of the old lighthouse in Alexandria and ordered a fortress to be built on its foundations. The construction lasted about 2 years, and it is said that Qaitbay spent more than a hundred thousand gold dinars for the work on the Citadel.\n\nIbn Ayas mentioned that building of this fort started in the month of Rabi Alawal 882 H. He said that the Sultan Qaitbay traveled to Alexandria, accompanied with some other Mameluke princes, to visit the site of the old lighthouse and during this visit he ordered the building of the Citadel.\n\nIn the month of Shaban 884 H, the Sultan Qaitbay travelled again to Alexandria when the construction was finished. He provided the fort with a brave legion of soldiers and various weapons. He also, as Ibn Ayas mentioned, dedicated several waqfs from which he financed the construction works as well as the salaries of the soldiers.\n\nThroughout the Mameluke period, and due to its strategic location, the Citadel was well maintained by all the rulers who came after Qaitbay. ]",
                                               address: "Located in the far west of Alexandria",
                                               gmapLocation: nil,
//                                               openingHours: nil,
                                               translatedOpeningHours: nil,
//                                               startingPrice: 5,
//                                               ticketPrices: nil,
//                                               isLiked: nil,
                                               reviews: [],
                                               rating: 0,
                                               reviewsNo: 0,
                                               audioURL: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/24/OK6cadyXCY3qDdXtq1xIr6q59R8Syr-metaMjctUWFpdGJheS1DaXRhZGVsXzAxLm1wMw%3D%3D-.mp3",
                                               hasAudio: true)
    
}
