Class {
	#name : #TypGtGraphForceBasedLayout,
	#superclass : #GtGraphForceBasedLayout,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtGraphForceBasedLayout >> initialize [

	super initialize.
	strength := 8.
	length := 40.
	charge := -4000
]
