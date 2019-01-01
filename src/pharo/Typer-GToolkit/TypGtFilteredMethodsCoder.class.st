Class {
	#name : #TypGtFilteredMethodsCoder,
	#superclass : #GtFilteredMethodsCoder,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #'initialize-release' }
TypGtFilteredMethodsCoder >> methodAdded: aValueAdded [
	| coder |
	coder := TypGtMethodCoder forMethod: (aValueAdded newValue "typCastAs CompiledMethod<Integer>").
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
