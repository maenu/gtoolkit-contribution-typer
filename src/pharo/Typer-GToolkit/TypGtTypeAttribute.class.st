Class {
	#name : #TypGtTypeAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'types'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #initialization }
TypGtTypeAttribute >> initialize [
	super initialize.
	self
		beAppend;
		stencil: [ | s |
			s := [ types inferredType printString ]
				on: TypNoInferrableTypeError
				do: [ '?' ].
			BrLabel new
				text: ':' , s;
				margin:
					(BlInsets
						top: 4
						right: 2
						bottom: 0
						left: 2);
				look:
					(BrGlamorousLabelLook new
						foreground: Color veryLightGray;
						fontSize: 12) ]
]

{ #category : #accessing }
TypGtTypeAttribute >> types [
	^ types
]

{ #category : #accessing }
TypGtTypeAttribute >> types: anObject [
	types := anObject
]
