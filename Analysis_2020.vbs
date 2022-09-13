Sub Analysis_2020()'Column labelsRange("I" & 1).Value = "Ticker"Range("J" & 1).Value = "Yearly Change"Range("K" & 1).Value = "Percent Change"Range("L" & 1).Value = "Total Stock Volume"'Set an initial variable for holding the ticker nameDim Ticker_Name As String'Set an initial value for the starting ticker valueDim Ticker_Start As DoubleTicker_Start = Cells(2, 3).Value'Set an initial variable holder for the ending ticker valueDim Ticker_End As DoubleTicker_End = 0'Set an initial variable holder for the total ticker volumeDim Total_Volume As DoubleTotal_Volume = 0'Keep track of the location for each ticker symbol in the tableDim Table_Row As IntegerTable_Row = 2'Loop through all table entriesFor i = 2 To 759001        'Check to see if we are still within the same ticker symbol, if we are not ...    If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then            'Set the Ticker name        Ticker_Name = Cells(i, 1).Value        Range("I" & Table_Row).Value = Ticker_Name               'Set the ending ticker value        Ticker_End = Cells(i, 6).Value                'Compute the yearly change and percent change for the ticker        Yearly_Change = Ticker_End - Ticker_Start        Percent_Change = (Yearly_Change / Ticker_Start) * 100                'Insert the rounded yearly change and percent change values into the appropriate columns        Range("J" & Table_Row).Value = Round(Yearly_Change, 2)        Range("K" & Table_Row).Value = CStr(Round(Percent_Change, 2)) & "%"                'Set the total ticker value and insert into the appropriate column        Total_Volume = Total_Volume + Cells(i, 7).Value        Range("L" & Table_Row).Value = Total_Volume                'Update the table row        Table_Row = Table_Row + 1                'Reset the ticker start, end, and total volume variables        Ticker_Start = Cells(i + 1, 3).Value        Ticker_End = 0        Total_Volume = 0                    'If the cell immediately following a row is the same ticker ...    Else            'Update the total ticker volume        Total_Volume = Total_Volume + Cells(i, 7).Value            End If    Next i                'Loop through all table entriesFor i = 2 To 759001        'Format positive yearly change cells to be green    If Cells(i, 10).Value > 0 Then        Cells(i, 10).Interior.ColorIndex = 4            'Format negative yearly change cells to be red    ElseIf Cells(i, 10).Value < 0 Then        Cells(i, 10).Interior.ColorIndex = 3            End IfNext iEnd Sub