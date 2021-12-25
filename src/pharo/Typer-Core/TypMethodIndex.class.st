Class {
	#name : #TypMethodIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodIndex class >> instance [

	<typPraResult: 'TypMethodLookupIndex'>
	^ instance ifNil: [ 
		  instance := self new initializeResolver:
			              (TypBreadthFirstResolver resolvers: { 
					               (TypDepthFirstResolver resolver:
						                (TypBreadthFirstResolver resolvers: { 
								                 TypPraMethodResolver new.
								                 TypShaMethodResolver new })).
					               (TypDepthFirstResolver resolver:
						                TypInfMethodResolver new) }) ]
]

{ #category : #accessing }
TypMethodIndex >> lookupMethodReceiver: aType selector: aSymbol arguments: aCollection [

	^ self resolve: (TypMethodLookup
			   receiver: aType
			   selector: aSymbol
			   arguments: aCollection asArray)
]
