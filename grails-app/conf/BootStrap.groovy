import edu.ggu.faculty.seatingchart.Chart
import edu.ggu.faculty.seatingchart.Seat

class BootStrap {

    def init = { servletContext ->
		println("bootstrap init")
		
				
		new Chart(name: 'Chart #1', userId:123, courseSectionId:123, roomId:001)
            .addToSeats(new Seat(name: 'Seat #1', userId:123, seatNumber:001))
			.addToSeats(new Seat(name: 'Seat #2', userId:123, seatNumber:002))
            .save(flush: true)
       
        assert Chart.count() == 1
        assert Seat.count() == 2
               
        Seat s = Seat.findByName('Seat #1')
        Chart c = s.chart
       
        assert c.name == 'Chart #1'
    }
    def destroy = {
    }
}
