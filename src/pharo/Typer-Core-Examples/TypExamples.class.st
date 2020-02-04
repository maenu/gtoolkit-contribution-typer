Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-OLD'
}

{ #category : #accessing }
TypExamples >> recursion [
	| x |
	x := [ x ].
	^ x
]

{ #category : #accessing }
TypExamples >> typeAllMethods [
	<gtExample>
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
