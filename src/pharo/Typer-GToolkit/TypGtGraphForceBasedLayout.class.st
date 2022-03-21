Class {
	#name : #TypGtGraphForceBasedLayout,
	#superclass : #GtGraphForceBasedLayout,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtGraphForceBasedLayout >> initialize [

	super initialize.
	strength := 16.
	length := 16.
	charge := -200.
]
