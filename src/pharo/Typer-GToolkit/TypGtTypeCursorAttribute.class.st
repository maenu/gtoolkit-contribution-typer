Class {
	#name : #TypGtTypeCursorAttribute,
	#superclass : #BrTextCursorAttribute,
	#instVars : [
		'attribute'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtTypeCursorAttribute >> attribute [
	^ attribute
]

{ #category : #accessing }
TypGtTypeCursorAttribute >> attribute: anObject [
	attribute := anObject
]

{ #category : #initialization }
TypGtTypeCursorAttribute >> initialize [
	super initialize.
	self
		enterAction: [ :aTextEditor :anEvent | 
			| position |
			position := anEvent cursor position.
			(aTextEditor text from: position to: position) attribute: attribute.
			aTextEditor invalidate: position to: position ];
		leaveAction: [ :aTextEditor :anEvent | 
			| position |
			position := anEvent cursor position.
			(aTextEditor text from: position to: position) clearAttributes: [ :e | e == attribute ].
			aTextEditor invalidate: position to: position ]
]
