Class {
	#name : #TypInfInlLookupMessage,
	#superclass : #TypInfMessage,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlLookupMessage >> inReturnType [
	^ self type
]

{ #category : #accessing }
TypInfInlLookupMessage >> inSignalType [
	^ ({self asFunction signalsAlways.
		self asFunction signalsMaybe} reject: #isNil) typAsType
]

{ #category : #accessing }
TypInfInlLookupMessage >> method [
	^ context lookup resultOrUnknown
]

{ #category : #accessing }
TypInfInlLookupMessage >> newContexts [
	self recursiveContextOrNil
		ifNotNil: [ :c | 
			^ {TypInfRecursionContext
					sender: context
					state: state
					node: node
					lookup: c lookup
					message: self} ].
	^ self method signalsAlways
		ifNil: [ #() ]
		ifNotNil: [ :t | 
			{TypInfSignalContext
					sender: context
					state: state
					node: node
					lookup: context lookup
					message: self
					exception: t} ]
]

{ #category : #accessing }
TypInfInlLookupMessage >> transfer [
	| method |
	self constrainReceiver.
	self canInstall ifTrue: [ self install ].
	method := self method.
	self inArguments
		withIndexDo: [ :e :i | 
			i <= method arguments size
				ifTrue: [ self constrain: e to: (method arguments at: i) ] ].
	state at: self inReceiver put: self receiver asNonNullable.
	self put: method result
]
