Class {
	#name : #TypMethodIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodIndex class >> instance [

	<typPraResult: 'TypMethodLookupIndex'>
	^ instance ifNil: [ 
		  instance := self new
			              initializeResolver: (TypDepthFirstResolver resolver:
						               (TypBreadthFirstResolver resolvers: { 
									                TypPraMethodResolver new.
									                TypShaMethodResolver new.
									                TypInfMethodResolver new }));
			              yourself ]
]

{ #category : #accessing }
TypMethodIndex >> canLookupMethodReceiver: aType selector: aSymbol arguments: aCollection [
	^ self
		canResolve: (TypMethodLookup
				receiver: aType
				selector: aSymbol
				arguments: aCollection
				super: nil)
]

{ #category : #accessing }
TypMethodIndex >> lookupMethodReceiver: aType selector: aSymbol arguments: aCollection [

	^ self resolve: (TypMethodLookup
			   receiver: aType
			   selector: aSymbol
			   arguments: aCollection
			   super: nil)
]

{ #category : #printing }
TypMethodIndex >> printOn: aStream [

	aStream nextPutAll: 'methods'
]
