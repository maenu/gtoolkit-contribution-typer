Class {
	#name : #TypInfSuper,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSuper >> canResolve: aType method: aSymbol arguments: aCollection [
	self super ifNil: [ ^ false ].
	^ context self
		canResolveMethod: (self
				newLookup: aType
				method: aSymbol
				arguments: aCollection)
]

{ #category : #accessing }
TypInfSuper >> newLookup: aType method: aSymbol arguments: aCollection [
	self assert: [ self super isNotNil ].
	^ TypMethodLookup
		receiver: self super
		selector: aSymbol
		arguments: aCollection
		self: context self
		super: self super
		parent: nil
]

{ #category : #accessing }
TypInfSuper >> preResolve: aType method: aSymbol arguments: aCollection [
	self super ifNil: [ ^ #() ].
	^ super
		preResolve: aType
		method: aSymbol
		arguments: aCollection
]

{ #category : #accessing }
TypInfSuper >> super [
	^ context super ifNil: nil ifNotNil: #superOrNil
]

{ #category : #initialization }
TypInfSuper >> transfer [
	state at: self put: (context super ifNil: TypNilType instance)
]
