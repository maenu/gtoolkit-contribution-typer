Class {
	#name : #TypGtMondrianLayoutBuilder,
	#superclass : #GtMondrianLayoutBuilder,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtMondrianLayoutBuilder >> force [

	^ self custom: TypGtGraphForceBasedLayout new
]
