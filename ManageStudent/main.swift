

import Foundation

struct Student {
    var name:String
    var id:String
    var mathScore: Float
    var physicsScore: Float
    var chemistryScore: Float
    
    init(name: String, id: String, mathScore: Float, physicsScore: Float, chemistryScore: Float) {
        self.name = name
        self.id = id
        self.mathScore = mathScore
        self.physicsScore = physicsScore
        self.chemistryScore = chemistryScore
    }
    
    func calculateAverageScore() -> Float{
        return (mathScore + physicsScore + chemistryScore) / 3
    }
}

var data = [String:Student]()

func addStudent(){
    print("Nhap ten sinh vien: ")
    let name = readLine() ?? "Illegal name add"
    print("Nhập ID: ")
    
    let id = readLine() ?? "Illegal id"
    if let check = data[id] {
        print("ID đã tồn tại. Vui lòng thêm mới.")
        return
    }
    print("Nhập điểm toán: ")
    guard let input = readLine(), let math = Float(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    print("Nhập điểm lý: ")
    guard let input = readLine(), let physic = Float(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    print("Nhập điểm hóa: ")
    guard let input = readLine(), let chemistry = Float(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    
    let student = Student(name: name, id: id, mathScore: math, physicsScore: physic, chemistryScore: chemistry)
    data[id] = student
    print("Thêm sinh viên thành công")
}


func showByAverageScore(){
    let dataSorted = data.sorted {
        (student1, studen2) -> Bool in
        return student1.value.calculateAverageScore() > studen2.value.calculateAverageScore()
    }
    for value in dataSorted {
        let student = value.value
        print("" + student.name + " - id: \(student.id)" + " - average: " + String(format: "%.2f", student.calculateAverageScore()) + " - math: \(student.mathScore)" + " - physic: \(student.physicsScore)"
              + " - chemistry: \(student.chemistryScore)")
    }
}

func updateScore(){
    print("Nhập ID sinh viên: ")
    let id = readLine() ?? "Illegal name update"
    guard let student = data[id] else{
        print("ID chưa tồn tại. Vui lòng thêm mới.")
        return
    }
    print("Nhập điểm toán: ")
    guard let input = readLine(), let math = Float(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    print("Nhập điểm lý: ")
    guard let input = readLine(), let physic = Float(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    print("Nhập điểm hóa: ")
    guard let input = readLine(), let chemistry = Float(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    
    let studentAfterUpdate = Student(name: student.name, id: id, mathScore: math, physicsScore: physic, chemistryScore: chemistry)
    data[id] = studentAfterUpdate
    print("Cập nhật thành công.")
    
}

func mainFunc(){
    while true {
        print("""
            =============================================================
            1. Thêm mới sinh viên
            2. Cập nhật điểm số sinh viên
            3. Hiển thị danh sách sinh viên theo điểm trung bình giảm dần
            0. Thoát
            Chọn:
            """)
        
        if let input = readLine(), let number = Int(input) {
            switch number {
            case 1:
                addStudent()
            case 2:
                updateScore()
            case 3:
                showByAverageScore()
            case 0:
                return
            default:
                print("Giá trị không hợp lệ. Vui lòng chọn lại.")
            }
        }else{
            print("Giá trị không hợp lệ. Vui lòng chọn lại.")
        }
    }
}
mainFunc()
