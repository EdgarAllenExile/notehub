# Swift Notes

## Navigation Link

Steps for Resolution of this Issue:

- Stick Everything in a NavigationStack
- wiggle things around a little bit
- hope that hidden() and isActive() are the same thing...

Also then just use this as a template:

`                    NavigationLink(
                        destination: ,
                        label: {
                            Text("Trigger").hidden()
                        }
                    ).isDetailLink(false).disabled(self. )`
