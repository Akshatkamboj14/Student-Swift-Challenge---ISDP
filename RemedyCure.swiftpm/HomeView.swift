import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Spacer()
                    Text("Welcome to RemedyCure")
                        .font(.system(size: 38))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                    
                    Image(systemName: "leaf.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                    
                    Spacer()
                    
                    NavigationLink(destination: CategoriesListView()) {
                        Text("Explore Remedies")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .navigationBarHidden(true)
            }
        }.accentColor(.white)
    }
}
struct CategoriesListView: View {
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Categories")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
                List {
                    NavigationLink(destination: RemediesListView(category: "General")) {
                        Text("General")
                    }
                    NavigationLink(destination: RemediesListView(category: "Headaches & Migraines")) {
                        Text("Headaches & Migraines")
                    }
                    NavigationLink(destination: RemediesListView(category: "Appetite")) {
                        Text("Appetite")
                    }
                    
                    NavigationLink(destination: RemediesListView(category: "Digestive Health")) {
                        Text("Digestive Health")
                    }
                    NavigationLink(destination: RemediesListView(category: "Kids")) {
                        Text("Kids")
                    }
                    NavigationLink(destination: RemediesListView(category: "Throat")) {
                        Text("Throat")
                    }
                }
                .scrollContentBackground(.hidden)
                .foregroundColor(.green)
            
            }
        }
            
    }
}
struct RemediesListView: View {
    var category: String
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text(category)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
            ScrollView {
                StaggeredGrid(columns: 2) {
                    ForEach(sampleRemedies.filter { $0.category == category }, id: \.name) { remedy in
                        NavigationLink(destination: RemediesDetailView(remedy: remedy)) {
                            VStack(alignment: .leading) {
                                Text(remedy.name)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                    .padding(.bottom, 4)
                                
                                Text(remedy.description)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .lineLimit(3)
                            }
                            .padding()
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.vertical, 8)
            }
        }
    }
    }
}

struct RemediesDetailView: View {
    var remedy: Remedy
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.green,Color.green, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text(remedy.name)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
                    .padding()
                
                Text(remedy.description)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    shareRemedy(remedy)
                }) {
                    Text("Share")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(20)
                }
                .padding()
            }
        }
    }
    
    func shareRemedy(_ remedy: Remedy) {
        let text = "Check out this remedy for \(remedy.category): \(remedy.name) - \(remedy.description)"
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
}

struct Remedy {
    var name: String
    var description: String
    var category: String
}

let sampleRemedies = [
    Remedy(name: "Turmeric and cayenne pepper - Detox", description: "Add one teaspoon of turmeric powder, juice from one lemon, a pinch of cayenne pepper, and a little honey (to taste) to one cup of warm water. Drink this once daily for a few days or weeks. Alternatively, boil two cups of water, add one-half teaspoon each of turmeric powder and dry ginger powder, and let it simmer for 10 minutes. Then strain the tea and add juice from half a lemon and one tablespoon of pure maple syrup. Drink this daily or a few times a week for a few weeks.", category: "General"),
    
    Remedy(name: "Green Tea - Detox", description: "Drink two to three cups of green tea daily. You can also take green tea extract supplements.", category: "General"),
    
    Remedy(name: "Ginger - Hiccups", description: "Suck 2-3 small pieces of fresh ginger.", category: "General"),
    
    Remedy(name: "Breathing - Hiccups", description: "Breath in as deeply as you can, then exhale as hard as you can; repeat 10 times; when exhaling the last time, keep the air pushed out, not taking another breath for as long as you can stand. This normally works the first try but repeat if necessary. Be sure to sit down when doing this", category: "General"),
    
    Remedy(name: "Lemon and Honey - Hangover", description: "Add two teaspoons of fresh lemon juice and one teaspoon of honey to a glass of warm water. Stir well and drink it down slowly. Do this as soon as you wake up, as well as two or three times more throughout the day.", category: "General"),
    
    Remedy(name: "Ginger - Hangover", description: "Chew small pieces of ginger throughout the day to get relief from a hangover. You can also have ginger tea. Alternatively, add 10 to 12 slices of fresh ginger root to about four cups of water and boil it for 10 minutes. Strain and then add the juice of one orange, half a lemon and one-half cup of honey. Drink this while it is still warm, many times throughout the day.", category: "General"),
    
    Remedy(name: "Liquorice Tea - Fatigue", description: "Add 1 teaspoon of liquorice powder to a cup of hot water. Cover let it soak for 10 minutes and strain it. Drink this tea 2 or 3 times a day for a week.", category: "General"),
    
    Remedy(name: "Vitamin B Rich Food - Fatigue", description: "Eat foods high in B vitamins like whole grains, beans, fortified breakfast cereals, and dairy products.", category: "General"),
    
    Remedy(name: "Eucalyptus Oil", description: "Inhaling eucalyptus oil can help with respiratory issues and congestion.", category: "Headaches & Migraines"),
    
    Remedy(name: "Chamomile", description: "Chamomile tea can promote relaxation and help with sleep.", category: "Headaches & Migraines"),
    
    Remedy(name: "Peppermint Oil", description: "Peppermint oil applied to the temples can help relieve headaches.", category: "Headaches & Migraines"),
    
    Remedy(name: "Ice Pack", description: "Applying an ice pack to the back of your neck can give you relief from a migraine headache. You can also place a washcloth dipped in ice-cold water over your head for five minutes. Repeat the process several times. Alternatively, you can use a bag of frozen vegetables as a cold compress. Within half an hour you will feel some relief.", category: "Headaches & Migraines"),
    
    Remedy(name: "Cloves", description: "Crush a few cloves gently and put them in a sachet or a clean handkerchief. Inhale the smell of the crushed cloves whenever you have a headache until you get some relief from the pain. Another option is to put two drops of clove oil in a tablespoon of carrier oil and massage your forehead and temples with it. You can also mix together two teaspoons of coconut oil, one teaspoon of sea salt and two drops of clove oil and rub this mixture gently on your forehead.", category: "Headaches & Migraines"),
    
    Remedy(name: "Lavender Essential Oil", description: "Put a few drops of lavender essential oil on a tissue and inhale it. You can also add two drops of lavender oil to two cups of boiling water and inhale the steam. Another option is to mix two or three drops of lavender essential oil in one tablespoon of carrier oil such as almond oil or olive oil and massage your forehead with it. Note: Do not take lavender oil orally.", category: "Headaches & Migraines"),
    
    Remedy(name: "Apple Cider Vinegar", description: "Simply eat an apple with some salt. You can also add two teaspoons of apple cider vinegar to a full glass of water and drink it.", category: "Headaches & Migraines"),
    
    Remedy(name: "Massage", description: "Simply massage your forehead and temples with a few drops of rosemary oil mixed in a tablespoon of carrier oil. Alternatively, make an herbal tea by boiling one teaspoon of crushed rosemary leaves and one teaspoon of crushed sage leaves in a cup of water. Cover it while boiling and then let it sock for 10 minutes. Let the tea cool to room temperature, then drink it. You can have this herbal tea two to three times a day. If both the herbs are not available, you can make the tea with either of the two herbs alone. Note: Rosemary oil may not be suitable for those suffering from epilepsy or high blood pressure.", category: "Headaches & Migraines"),
    
    Remedy(name: "Honey and Lemon", description: "Mixing honey and lemon in warm water can help soothe a sore throat.", category: "Appetite"),
    
    Remedy(name: "Ginger", description: "Ginger can help alleviate nausea and aid digestion.", category: "Appetite"),
    
    Remedy(name: "Ginger Tea", description: "Ginger tea can aid in digestion and soothe an upset stomach.", category: "Digestive Health"),
    
    Remedy(name: "Water", description: "Adequate water intake helps cleanse your internal system and hydrates your entire body. It also facilitates bowel movements and keeps the stools soft, hopefully reducing the need for straining.", category: "Digestive Health"),
    
    Remedy(name: "Apple Cider Vinegar", description: "In the case of external haemorrhoids, gently press a cotton ball soaked in apple cider vinegar against the inflamed area. Initially there will be a stinging sensation, but soon you will get relief from the itching and irritation. Do this several times a day until the swelling decreases. In the case of internal haemorrhoids, add one teaspoon of apple cider vinegar to a glass of water and drink it at least twice daily. You can add honey to make it taste better.", category: "Digestive Health"),
    
    Remedy(name: "Lemon Juice", description: "Saturate a cotton ball with freshly squeezed lemon juice and apply it on the haemorrhoid. Initially there will be some mild tingling or a burning sensation, but relief from the pain will soon follow. Alternatively, squeeze half a lemon into a cup of hot milk and drink it. Repeat every three hours for best results. Mix one-half teaspoon each of lemon juice, ginger juice, mint juice and honey together. Take this once a day.", category: "Digestive Health"),
    
    Remedy(name: "Wounds", description: "Children often suffer from minor wounds while playing around in the park or at home. When the outer skin layer becomes torn or punctured, it can produce symptoms including bleeding, redness, swelling, inflammation, pain and tenderness. To treat a wound, you need to thoroughly clean it first. Keep the affected area under clean running water to get rid of any dirt, dust and other particles. Wash it with a mild antiseptic soap and pat dry. To facilitate healing, apply extra-virgin coconut oil on the wounded area and cover it with a bandage. Repeat this remedy 2 or 3 times a day for a few days.", category: "Kids"),
    
    Remedy(name: "Cinnamon", description: "Cinnamon is the best home remedy for bedwetting. This spice keeps the body warm, which in turn helps prevent bedwetting. Give your child a small cinnamon stick to chew thoroughly once a day. Another option is to sprinkle cinnamon powder and sugar on a piece of toast and give it to your child for breakfast. Massaging your child’s lower abdomen with warm olive oil for 5 minutes, a few times daily, can also help treat bedwetting.", category: "Kids"),
    
    Remedy(name: "Honey", description: "For children suffering from the common cold, raw honey is a good remedy due to its antimicrobial properties. It also helps reduce night-time coughing and improves sleep. Mix 2 teaspoons of raw honey and 1 teaspoon of lemon juice. Give it to your child 3 or 4 times a day for a few days. In case of fever, do not forget to give your child a sponge bath to help reduce body temperature. Note: Do not give honey to children under age 1 as it can cause infant botulism.", category: "Kids"),
    
    Remedy(name: "Turmeric", description: "Turmeric is a good remedy for coughs due to its anti-inflammatory, antibacterial and antiviral action. Mix half teaspoon of turmeric powder in a glass of warm milk and give it to your child to drink twice daily. For a dry cough, mix half teaspoon of turmeric powder with 1 teaspoon of honey and give it to your child 3 times a day. Drinking warm lemonade can also help treat coughs in children.", category: "Kids"),
    
    Remedy(name: "Raw Honey - Cough", description: "Add 1 tablespoon of raw honey to a glass of warm water or milk and drink it slowly. Repeat a few times a day. This drink will have a soothing effect on the throat. Alternatively, mix equal quantities of honey, ginger juice, and pomegranate juice. Consume 1 tablespoon of this mixture 2 or 3 times a day. Before going to bed, consume 1 to 2 teaspoons of raw honey with a little cinnamon powder.", category: "Throat"),
    
    Remedy(name: "Salt Water Gargling - Cough", description: "Add 1 teaspoon of salt to 1 cup of warm water. Stir it until the salt mixes in properly. Gargle with this water 2 or 3 times a day.", category: "Throat"),
    
    Remedy(name: "Dried Marshmallow Root - Sore Throat", description: "Add one tablespoon of dried marshmallow root to one cup of boiling water and soak it for about half an hour. Strain the solution, add some honey and drink it. You can have three cups of this herbal tea in a day.", category: "Throat"),
    
    Remedy(name: "Cinnamon and Black Pepper - Sore Throat", description: "Add one teaspoon each of cinnamon powder and black pepper powder to a glass of warm water. You may also add cardamom. Strain the solution and gargle with it two to three times a day. Another option is to mix a few drops of cinnamon oil and one teaspoon of pure honey. Eat this two times a day to get relief from the pain and inflammation associated with a sore throat.", category: "Throat"),
    
    Remedy(name: "Basil Leaves - Tonsillities", description: "Add 10 to 12 basil leaves to one and one-half cups of water. Boil for 10 minutes. Strain and add the juice from one lemon to the solution. Optionally, add one teaspoon of honey to sweeten it. Drink this three times a day for two to three days.", category: "Throat"),
    
    Remedy(name: "Slipper Elm - Tonsillities", description: "Add one teaspoon of the inner bark of slippery elm to two cups of boiling water. Allow it to soak for five minutes, and then strain the solution. Drink it slowly while it is still warm twice daily for a few days. Alternatively, mix three teaspoons of the powdered bark of slippery elm, one teaspoon of cayenne pepper powder, two teaspoons of honey and four teaspoons of warm water. Take one teaspoon of this mixture at regular intervals for two to three days.", category: "Throat")
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct StaggeredGrid<Content: View>: View {
    var columns: Int
    var list: [GridItem] {
        Array(repeating: .init(.flexible()), count: columns)
    }
    let content: () -> Content
    
    init(columns: Int, @ViewBuilder content: @escaping () -> Content) {
        self.columns = columns
        self.content = content
    }
    
    var body: some View {
        LazyVGrid(columns: list) {
            content()
        }
    }
}
#Preview {
    HomeView()
}
