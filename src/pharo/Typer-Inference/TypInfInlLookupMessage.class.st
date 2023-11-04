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
TypInfInlLookupMessage >> method [
	^ context lookup resultOrUnknown
]

{ #category : #accessing }
TypInfInlLookupMessage >> newContexts [
	self recursiveContextOrNil
		ifNotNil: [ :c | 
			^ {lookup
					-> (TypInfRecursionContext
							sender: context
							state: state copy
							node: node
							self: context self
							super: context super
							message: self)} ].
	^ self method signalsAlways
		ifNil: [ #() ]
		ifNotNil: [ :t | 
			{lookup
					-> (TypInfSignalContext
							sender: context
							state: state copy
							node: node
							self: context self
							super: context super
							message: self
							exception: t)} ]
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
	state at: self put: method result.
	state at: self inReceiver put: self receiver asNonNullable
]
