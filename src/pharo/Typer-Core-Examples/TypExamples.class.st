Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples'
}

{ #category : #'as yet unclassified' }
TypExamples >> typeAllMethods [
	TypLookupIndex resetAll.
	^ Smalltalk globals allClassesAndTraits
		flatCollect: [ :e | 
			{e.
			e classSide}
				flatCollect: [ :f | 
					f methods
						collect: [ :g | 
							(g methodClass -> g selector
								->
								[ g ast
								typTypeReset;
								typType ] timeToRun)
								traceCr;
								yourself ] ] ]
]
