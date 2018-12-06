Class {
	#name : #TypGtMethodsCoder,
	#superclass : #GtMethodsCoder,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #'initialize-release' }
TypGtMethodsCoder >> forMethods: compiledMethods [
	methods := compiledMethods.
	methodCoders := methods collect: [ :each | TypGtMethodCoder forMethod: each ].
	(methods isKindOf: GtCoderMethodsCollection)
		ifTrue: [ methods announcer weak
				when: ValueAdded send: #methodAdded: to: self;
				when: ValueChanged send: #methodChanged: to: self;
				when: ValueRemoved send: #methodRemoved: to: self.
			methodCoders do: [ :each | each highlighter: methods highlighter ] ]
]

{ #category : #'initialize-release' }
TypGtMethodsCoder >> methodAdded: aValueAdded [
	| coder |
	coder := TypGtMethodCoder forMethod: aValueAdded newValue.
	methodCoders add: coder
]
