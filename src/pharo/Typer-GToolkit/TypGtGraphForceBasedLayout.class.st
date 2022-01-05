Class {
	#name : #TypGtGraphForceBasedLayout,
	#superclass : #GtGraphForceBasedLayout,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtGraphForceBasedLayout >> initialize [

	super initialize.
	charge := -5000.
	length := 300.
	strength := 0.5
]
