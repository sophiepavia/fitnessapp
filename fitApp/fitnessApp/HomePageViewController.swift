//
//  HomePageViewController.swift
//  fitnessApp
//
//  Created by Sydney m on 3/30/21.
//

//need to import these to use charts
import UIKit
import Charts
import TinyConstraints


class HomePageViewController: UIViewController, ChartViewDelegate {

    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        let yAxis = chartView.leftAxis
        chartView.backgroundColor = .systemTeal
        
        chartView.rightAxis.enabled = false
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(4, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(10, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .white
        
        chartView.animate(xAxisDuration: 2.5)
        
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        
        setData()
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData(){
        let set = LineChartDataSet(entries: yValues, label: "Post Workout Mood")
        let data = LineChartData(dataSet: set)
        lineChartView.data = data
        
        set.lineWidth = 2
        set.setColor(.white)
        set.fill = Fill(color: .white)
        set.fillAlpha = 0.8
        set.mode = .cubicBezier
        set.highlightColor = .systemGray
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.drawFilledEnabled = true
        set.drawCirclesEnabled = false
        data.setDrawValues(false)
    }
    
    //data for testing purposes
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0, y: 0),
        ChartDataEntry(x: 1, y: 1),
        ChartDataEntry(x: 2, y: 3),
        ChartDataEntry(x: 3, y: 4),
        ChartDataEntry(x: 4, y: 2),
        ChartDataEntry(x: 5, y: 1),
        ChartDataEntry(x: 6, y: 3),
        ChartDataEntry(x: 7, y: 3),
        ChartDataEntry(x: 8, y: 4),
        ChartDataEntry(x: 9, y: 0),
        ChartDataEntry(x: 10, y: 1),
        ChartDataEntry(x: 11, y: 2),
        ChartDataEntry(x: 12, y: 3),
        ChartDataEntry(x: 13, y: 4),
        ChartDataEntry(x: 14, y: 2),
    ]
}
