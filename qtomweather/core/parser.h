#ifndef PARSER_H
#define PARSER_H
////////////////////////////////////////////////////////////////////////////////
#ifdef LIBXML
    #include <libxml++/libxml++.h>
    #include <libxml++/validators/schemavalidator.h>
#endif
#include <string>
#include <iostream>
#include "abstractconfig.h"
////////////////////////////////////////////////////////////////////////////////
namespace Core {
    class Parser : public AbstractConfig{
        protected:
            #ifdef LIBXML
            xmlpp::DomParser *parser;
            xmlpp::SchemaValidator *validator;
            #endif
            Parser(const std::string& filename, const std::string& schema_filename);
        public:
            virtual ~Parser();
            #ifdef LIBXML
            virtual void processNode(const xmlpp::Node* node) = 0;
            #endif
    };

} // namespace Core
////////////////////////////////////////////////////////////////////////////////
#endif // PARSER_H
