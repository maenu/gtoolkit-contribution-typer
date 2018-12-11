Class {
	#name : #TypGtMethodsCoder,
	#superclass : #GtMethodsCoder,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #'initialize-release' }
TypGtMethodsCoder >> forMethods: aCollection [
	<typTypeArgument: 1 as: 'SequenceableCollection<CompiledMethod<Integer>>'>
	methods := aCollection.
	methodCoders := methods
		collect: [ :e | TypGtMethodCoder forMethod: e ].
	(methods isKindOf: GtCoderMethodsCollection)
		ifTrue: [ methods announcer weak
				when: ValueAdded send: #methodAdded: to: self;
				when: ValueChanged send: #methodChanged: to: self;
				when: ValueRemoved send: #methodRemoved: to: self.
			methodCoders do: [ :e | e highlighter: methods highlighter ] ]
]

{ #category : #'initialize-release' }
TypGtMethodsCoder >> methodAdded: aValueAdded [
	<typTypeArgument: 1 as: 'ValueAdded'>
	| coder |
	coder := TypGtMethodCoder forMethod: aValueAdded newValue.
	methodCoders add: coder
]
