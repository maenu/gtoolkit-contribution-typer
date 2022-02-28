Class {
	#name : #TypVariableLookup,
	#superclass : #TypPropertyLookup,
	#category : #'Typer-Core-Lookup'
}

{ #category : #'as yet unclassified' }
TypVariableLookup class >> receiver: aType selector: aSymbol super: aLookup [

	^ self index
		  at: { 
				  aType.
				  aSymbol asSymbol.
				  aLookup }
		  ifAbsentPut: [ 
			  self new
				  initializeReceiver: aType selector: aSymbol asSymbol;
				  initializeSuper: aLookup;
				  yourself ]
]

{ #category : #converting }
TypVariableLookup >> asSuper [

	self assert: [ self hasSuper ].
	^ self class receiver: receiver super selector: selector super: self
]
