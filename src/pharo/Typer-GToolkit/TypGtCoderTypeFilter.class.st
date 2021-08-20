Class {
	#name : #TypGtCoderTypeFilter,
	#superclass : #GtSearchMethodsFilter,
	#instVars : [
		'type'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #testing }
TypGtCoderTypeFilter >> includesMethod: aCompiledMethod [

	<typPraResult: 'Boolean'>
	<typPraArguments: 'CompiledMethod()->?'>
	| methodType |
	methodType := aCompiledMethod typGtSelf.
	type isUnion
		ifTrue: [ 
			type types
				detect: [ :e | e <= methodType ]
				ifFound: [  ]
				ifNone: [ ^ false ] ]
		ifFalse: [ type <= methodType ifFalse: [ ^ false ] ].
	^ (type lookupMethod: aCompiledMethod selector) isUnknown not
]

{ #category : #initialization }
TypGtCoderTypeFilter >> initialize [
	<typPraVariable: 'type' as: 'TypType'>
	super initialize
]

{ #category : #accessing }
TypGtCoderTypeFilter >> type [
	<typPraResult: 'TypType'>
	^ type
]

{ #category : #accessing }
TypGtCoderTypeFilter >> type: anObject [
	<typPraArguments: 'TypType'>
	type := anObject
]
