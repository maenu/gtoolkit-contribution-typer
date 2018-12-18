Class {
	#name : #TypGtMethodsCoder,
	#superclass : #GtMethodsCoder,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #'initialize-release' }
TypGtMethodsCoder >> methodAdded: aValueAdded [
	<typTypeArgument: 1 as: 'ValueAdded'>
	| coder |
	coder := TypGtMethodCoder forMethod: aValueAdded newValue.
	methodCoders add: coder.
	self announce: (GtMethodCoderAdded new coder: self; methodCoder: coder)
]

{ #category : #'initialize-release' }
TypGtMethodsCoder >> newMethodCoderFor: aMethod [
	| coder |
	coder := TypGtMethodCoder forMethod: aMethod.
	coder methodsCoder: self.
	^ coder
]
