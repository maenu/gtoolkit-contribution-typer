Class {
	#name : #TypInfConstrainEdge,
	#superclass : #TypInfEdge,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfConstrainEdge class >> origin: aNode target: anotherNode type: aType [

	^ (self origin: aNode target: anotherNode key: #constrain)
		  state:
			  (TypInfState self: aNode state self super: aNode state super);
		  type: aType;
		  yourself
]
