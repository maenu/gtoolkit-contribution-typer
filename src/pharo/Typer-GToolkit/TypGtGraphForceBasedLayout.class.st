Class {
	#name : #TypGtGraphForceBasedLayout,
	#superclass : #GtGraphForceBasedLayout,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtGraphForceBasedLayout >> initialize [

	super initialize.
	strength := 10.
	length := 100.
	charge := -10000
]
