Class {
	#name : #TypGtGraphForceBasedLayout,
	#superclass : #GtGraphForceBasedLayout,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtGraphForceBasedLayout >> initialize [
	super initialize.
	strength := 1.
	length := 16.
	charge := -200.
	gravity := 0.01.
	alpha := 0.5
]
