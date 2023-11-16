Class {
	#name : #TypVariableLookup,
	#superclass : #TypPropertyLookup,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableLookup class >> receiver: aType selector: aSymbol [
	^ self index
		typAt: {aType.
				aSymbol asSymbol}
		ifAbsentPut: [ self new
				initializeReceiver: aType selector: aSymbol asSymbol;
				yourself ]
]

{ #category : #accessing }
TypVariableLookup class >> resolver [
	^ resolver
		ifNil: [ resolver := TypBreadthFirstResolver
					resolvers: {TypDepthFirstResolver resolver: TypPraVariableResolver new.
							TypDepthFirstResolver resolver: TypShaVariableResolver new.
							TypDepthFirstResolver resolver: TypInfVariableResolver new} ]
]

{ #category : #accessing }
TypVariableLookup >> withReceiver: aType [
	^ self class receiver: aType selector: selector
]
