Class {
	#name : #TypStaMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Static-Core'
}

{ #category : #'as yet unclassified' }
TypStaMethodResolver >> resolverFor: aCompiledMethod [
	self assert: [ self resolves: aCompiledMethod ].
	^ aCompiledMethod methodClass isMeta
		ifTrue: [ aCompiledMethod methodClass instanceSide typStaClassMethodResolver ]
		ifFalse: [ aCompiledMethod methodClass typStaMethodResolver ]
]

{ #category : #'as yet unclassified' }
TypStaMethodResolver >> resolves: aCompiledMethod [
	^ aCompiledMethod methodClass isMeta
		ifTrue: [ aCompiledMethod methodClass instanceSide typStaResolvesMethod: aCompiledMethod ]
		ifFalse: [ aCompiledMethod methodClass typStaResolvesMethod: aCompiledMethod ]
]
