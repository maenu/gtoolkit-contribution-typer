Class {
	#name : #TypGtRoundedRectangleGeometry,
	#superclass : #BlRoundedRectangleGeometry,
	#instVars : [
		'bounds'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtRoundedRectangleGeometry class >> cornerRadius: aNumber bounds: aBounds [
	^ (self cornerRadius: aNumber)
		bounds: aBounds;
		yourself
]

{ #category : #accessing }
TypGtRoundedRectangleGeometry >> bounds [
	^ bounds
]

{ #category : #accessing }
TypGtRoundedRectangleGeometry >> bounds: anObject [
	bounds := anObject
]

{ #category : #accessing }
TypGtRoundedRectangleGeometry >> geometryBounds: aBounds [
	^ aBounds origin: bounds origin extent: bounds extent
]
