Class {
	#name : #TypGtFilteredMethodsCoder,
	#superclass : #GtFilteredMethodsCoder,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #'initialize-release' }
TypGtFilteredMethodsCoder >> methodAdded: aValueAdded [
	<typTypeArgument: 1 as: 'ValueAdded'>
	| coder |
	coder := TypGtMethodCoder forMethod: aValueAdded newValue.
	methodCoders add: coder.
	self announce: (GtMethodCoderAdded new coder: self; methodCoder: coder)
]

{ #category : #'initialize-release' }
TypGtFilteredMethodsCoder >> newMethodCoderFor: aMethod [
	| coder |
	coder := TypGtMethodCoder forMethod: aMethod.
	coder methodsCoder: self.
	^ coder
]
