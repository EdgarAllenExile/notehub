# Excel Macros

## Insert Checkboxes

```
Sub insertCheckboxes()
    Dim c As Range

    For Each c In Selection
        Dim cb As CheckBox
        Set cb = ActiveSheet.CheckBoxes.Add(c.Left, _
                                    c.Top, _
                                    c.Width, _
                                    c.Height)
        With cb
            .Caption = ""
            .Value = xlOff
            .LinkedCell = c.Offset(columnOffset:=1).Address
            .Display3DShading = False
        End With
    Next
End Sub
```

Inserts a checkbox within every cell of a selected range, offsets the linked cell 1 col. Does make the width weird, might be fixable if cell wisth is adjusted pre insertion.
