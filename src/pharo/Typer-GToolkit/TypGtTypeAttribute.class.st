Class {
	#name : #TypGtTypeAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'classes'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtTypeAttribute >> classes [
	^ classes
]

{ #category : #accessing }
TypGtTypeAttribute >> classes: anObject [
	classes := anObject
]

{ #category : #initialization }
TypGtTypeAttribute >> initialize [
	super initialize.
	self
		beAppend;
		stencil: [ | s |
			s := [ classes inferredType ]
				on: TypNoInferrableTypeError
				do: [ nil ].
			BrLabel new
				text: ':' , s printString;
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
